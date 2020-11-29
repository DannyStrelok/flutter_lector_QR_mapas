import 'package:flutter/material.dart';
import 'package:lector_qr/widgets/scan_tiles.dart';

class DirectionsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScanTiles(type: 'http');
  }
}
