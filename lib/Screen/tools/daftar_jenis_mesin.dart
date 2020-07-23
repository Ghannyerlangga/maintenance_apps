import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/tools/lihat_repair.dart';
import 'package:maintenance_apps/Screen/tools/list_consumable.dart';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          itemList('AMG'),
          itemList('CORYMPEX'),
          itemList('FICEP')
        ],
      ),
    );
  }

  Widget itemList(String title) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: ButtonTheme(
          minWidth: MediaQuery.of(context).size.width * 0.40,
          height: MediaQuery.of(context).size.height * 0.20,
          child: new FlatButton(
            padding: EdgeInsets.all(0),
            color: Colors.lightBlueAccent[100],
            onPressed: () {
              if (widget.mode == 'mesin') {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ListMesin(title),
                ));
              } else if (widget.mode == 'repair') {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ShowRepair(title),
                ));
              } else if (widget.mode == 'consumable') {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ListConsumable(title),
                ));
              }
            },
            child: Column(
              children: <Widget>[
                Container(
                  height: 50.0,
                  child: Image.asset(
                    "img/MachineFlatIcon.png",
                    height: 40.0,
                    width: 40.0,
                  ),
                  padding: EdgeInsets.all(10.0),
                ),
                new Container(
                    child: Text(
                  title,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20, color: Colors.white, shadows: [
                    Shadow(
                        color: Colors.lightBlue,
                        offset: Offset(1, 2),
                        blurRadius: 2)
                  ]),
                )),
              ],
            ),
          )),
    );
  }
}
