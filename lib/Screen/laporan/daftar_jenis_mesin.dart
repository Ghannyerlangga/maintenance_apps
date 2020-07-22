import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/tools/lihat_repair.dart';
import 'package:maintenance_apps/Screen/tools/list_mesin.dart';

class DaftarMesin extends StatefulWidget {
  final String mode;
  DaftarMesin(this.mode);
  @override
  _DaftarMesinState createState() => _DaftarMesinState();
}

class _DaftarMesinState extends State<DaftarMesin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Mesin'),
      ),
      body: ListView(
        children: <Widget>[
          itemList('AMG'),
          itemList('COPYMPEX'),
          itemList('FICEP')
        ],
      ),
    );
  }

  Widget itemList(String title) {
    return ListTile(
      title: Text(title),
      onTap: () {
        if (widget.mode == 'mesin') {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ListMesin(title),
          ));
        } else if (widget.mode == 'repair') {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ShowRepair(title),
          ));
        }
      },
    );
  }
}
