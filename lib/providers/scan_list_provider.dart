
import 'package:flutter/material.dart';
import 'package:lector_qr/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {

  List<ScanModel> scans = [];
  String selectedType = 'http';

  newScan(String value) async {
    final newScan = new ScanModel(value: value);
    final id = await DBProvider.db.newScan(newScan);
    newScan.id = id;
    if(this.selectedType == newScan.type) {
      this.scans.add(newScan);
      notifyListeners();
    }
  }

  loadScans() async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...scans];
    notifyListeners();
  }

  loadScansByType(String type) async {
    final scans = await DBProvider.db.getScansByType(type);
    this.scans = [...scans];
    this.selectedType = type;
    notifyListeners();
  }

  deleteAll() async {
    await DBProvider.db.deleteAllScans();
    this.scans = [];
    notifyListeners();
  }

  deleteScanById(int id) async {
    await DBProvider.db.deleteScan(id);
    this.loadScansByType(this.selectedType);
  }

}