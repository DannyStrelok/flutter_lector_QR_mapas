import 'dart:async';
import 'package:floating_pullup_card/floating_layout.dart';
import 'package:flutter/material.dart';
import 'package:lector_qr/models/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    final CameraPosition _startCords = CameraPosition(
      target: scan.getLatLng(),
      zoom: 16,
    );

    Set<Marker> markers = new Set<Marker>();
    markers.add(new Marker(
      markerId: MarkerId('geo-location'),
      position: scan.getLatLng(),
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        actions: [
          IconButton(
              icon: Icon(Icons.location_searching_sharp),
              onPressed: () async {
                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: scan.getLatLng(),
                    zoom: 16
                  )
                ));
          })
        ],
      ),
      body: FloatingPullUpCardLayout(
        child: GoogleMap(
          myLocationButtonEnabled: true,
          onCameraMove: (CameraPosition cp) {},
          mapType: mapType,
          initialCameraPosition: _startCords,
          markers: markers,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(scan.value),
              SizedBox(height: 10,),
              Text(scan.type),
              SizedBox(height: 10,),
              Text(scan.id.toString()),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.layers),
        onPressed: () {
          setState(() {
            if(mapType ==  MapType.normal) {
              mapType = MapType.satellite;
            } else {
              mapType = MapType.normal;
            }
          });
        },
      ),
    );
  }
}
