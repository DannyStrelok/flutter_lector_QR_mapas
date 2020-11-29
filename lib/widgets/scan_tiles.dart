import 'package:flutter/material.dart';
import 'package:lector_qr/providers/scan_list_provider.dart';
import 'package:lector_qr/utils/utils.dart';
import 'package:provider/provider.dart';

class ScanTiles extends StatelessWidget {

  final String type;

  const ScanTiles({@required this.type});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
        itemCount: scans.length,
        itemBuilder: (context, i) => Dismissible(
          key: UniqueKey(),
          background: Container(
            color: Colors.red,
          ),
          onDismissed: (DismissDirection direction) {
            Provider.of<ScanListProvider>(context, listen: false).deleteScanById(scans[i].id);
          },
          child: ListTile(
            leading: Icon(
              this.type == 'http' ? Icons.http : Icons.map,
              color: Theme.of(context).primaryColor,),
            title: Text(scans[i].value),
            subtitle: Text(scans[i].id.toString()),
            trailing: Icon(Icons.chevron_right, color: Colors.grey,),
            onTap: () {
              launchURL(context, scans[i]);
            },
          ),
        )
    );
  }
}
