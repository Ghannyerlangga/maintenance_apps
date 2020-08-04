import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/List_Mesin/amg_list.dart';

import 'List_Mesin/ficep_llist.dart';

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
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width * 0.40,
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: new FlatButton(
                    padding: EdgeInsets.all(0),
                    color: Colors.lightBlueAccent[100],
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AmgList(
                                    mesin: amg,
                                  )));
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                            child: Text(
                          amg,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                    color: Colors.lightBlue,
                                    offset: Offset(1, 2),
                                    blurRadius: 2)
                              ]),
                        )),
                      ],
                    ),
                  )),
            ),
          ]),
          // ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width * 0.40,
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: new FlatButton(
                    padding: EdgeInsets.all(0),
                    color: Colors.lightBlueAccent[100],
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AmgList(
                                    mesin: corympex,
                                  )));
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                            child: Text(
                          corympex,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                    color: Colors.lightBlue,
                                    offset: Offset(1, 2),
                                    blurRadius: 2)
                              ]),
                        )),
                      ],
                    ),
                  )),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width * 0.40,
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: new FlatButton(
                    padding: EdgeInsets.all(0),
                    color: Colors.lightBlueAccent[100],
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FicepList(
                                    mesin: ficep,
                                  )));
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                            child: Text(
                          ficep,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                    color: Colors.lightBlue,
                                    offset: Offset(1, 2),
                                    blurRadius: 2)
                              ]),
                        )),
                      ],
                    ),
                  )),
            ),
          ]),
        ],
      ),
    );
  }
}
