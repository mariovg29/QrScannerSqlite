import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrcode_sqlite/providers/scan_list_provider.dart';
import 'package:qrcode_sqlite/utils/utils.dart';

class ScanTiles extends StatelessWidget {
  

  final String? tipo;

  const ScanTiles({Key? key, this.tipo}) : super(key: key);

  


  

  @override
  Widget build(BuildContext context) {
     final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: ( _, i)=>Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.amber,
        ),
        onDismissed: (direction) {
          Provider.of<ScanListProvider>(context, listen: false).borrarScansByID(scans[i].id!);
          
        },
        child: ListTile(
          leading: Icon(
            tipo == 'http'
            ? Icons.account_balance_wallet_rounded
            :Icons.map,
            color: Theme.of(context).primaryColor),
          title: Text(scans[i].valor),                          
          subtitle: Text(scans[i].id.toString()),
          trailing: const Icon(Icons.keyboard_arrow_right,color: Colors.grey),
          onTap: () => launchURL(context, scans[i]),
          
      
        ),
      )
    
    );
  }
}