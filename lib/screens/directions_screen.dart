import 'package:flutter/material.dart';
import 'package:lector_qr/providers/scan_list_provider.dart';
import 'package:provider/provider.dart';

class DirectionsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return Container(
      child: ListView.builder(
        itemCount: scans.length,
        itemBuilder: (BuildContext context, int i) => ListTile(
          leading: Icon(Icons.http, color: Theme.of(context).primaryColor,),
          title: Text(scans[i].value),
          subtitle: Text(scans[i].id.toString()),
          trailing: Icon(Icons.chevron_right, color: Colors.grey,),
          onTap: () {
            print('direccion tap');
          },
        ),
      )
    );
  }
}
