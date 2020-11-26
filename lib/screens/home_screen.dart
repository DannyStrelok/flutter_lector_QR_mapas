import 'package:flutter/material.dart';
import 'package:lector_qr/screens/directions_screen.dart';
import 'package:lector_qr/screens/map_screen.dart';
import 'package:lector_qr/screens/maps_history_screen.dart';
import 'package:lector_qr/widgets/custom_navigatorbar.dart';
import 'package:lector_qr/widgets/scan_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Historial"),
        actions: [
          IconButton(icon: Icon(Icons.delete_forever), onPressed: (){})
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final currentIndex = 0;

    switch(currentIndex) {
      case 0: return MapScreen();
      case 1: return DirectionsScreen();
      default: return MapScreen();
    }

    return Container(

    );
  }
}
