import 'package:flutter/material.dart';
import 'package:lector_qr/providers/db_provider.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(BuildContext context, ScanModel scan) async {

  final url = scan.value;

  if(scan.type == 'http') {
    if( await canLaunch(url) ) {
      await launch(url);
    } else {
      throw 'No se puede abrir $url';
    }
  } else {
    Navigator.pushNamed(context, 'map', arguments: scan);
  }



}