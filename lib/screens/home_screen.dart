import 'package:flutter/material.dart';
import 'package:lector_qr/providers/scan_list_provider.dart';
import 'package:lector_qr/providers/ui_provider.dart';
import 'package:lector_qr/screens/directions_screen.dart';
import 'package:lector_qr/screens/maps_history_screen.dart';
import 'package:lector_qr/widgets/custom_navigatorbar.dart';
import 'package:lector_qr/widgets/scan_button.dart';
import 'package:provider/provider.dart';

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

    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

    switch(currentIndex) {
      case 0:
        scanListProvider.loadScansByType('geo');
        return MapsHistoryScreen();
      case 1:
        scanListProvider.loadScansByType('http');
        return DirectionsScreen();
      default: return MapsHistoryScreen();
    }

    return Container(

    );
  }
}
