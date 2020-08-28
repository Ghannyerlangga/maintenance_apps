import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/List_Mesin/amg_list.dart';
import 'package:maintenance_apps/Screen/List_Mesin/corympex_list.dart';
import 'package:maintenance_apps/Screen/List_Mesin/ficep_llist.dart';
import 'package:maintenance_apps/shared/button_type.dart';

class MainList extends StatefulWidget {
  @override
  _MainListState createState() => _MainListState();
}

class _MainListState extends State<MainList> {
  final String amg = "AMG";
  final String corympex = "CORYMPEX";
  final String ficep = "FICEP";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Mesin".toUpperCase()),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back, // add custom icons also
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.blue[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            ButtonList(
              type: amg,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AmgList(
                              mesin: amg,
                            )));
              },
            )
          ]),
          // ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            ButtonList(
              type: corympex,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CorympexList(
                              mesin: corympex,
                            )));
              },
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            ButtonList(
              type: ficep,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FicepList(
                              mesin: ficep,
                            )));
              },
            ),
          ]),
        ],
      ),
    );
  }
}
