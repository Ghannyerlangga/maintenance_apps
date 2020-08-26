import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/Document/document1.dart';
import 'package:maintenance_apps/Screen/barcode.dart';
import 'package:maintenance_apps/Screen/laporan/jenis_mesin_laporan.dart';
import 'package:maintenance_apps/Screen/maintenance_list.dart';
import 'package:maintenance_apps/Screen/prosedur.dart';
import 'package:maintenance_apps/Screen/tools.dart';
import 'package:maintenance_apps/Services/auth_services.dart';

class MainPage extends StatefulWidget {
  final FirebaseUser user;
  MainPage(this.user);
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  final CollectionReference data = Firestore.instance.collection("data");
  String nama;
  String position;

  Future getData() async {
    final DocumentReference result = data.document(widget.user.uid);
    await result.get().then((DocumentSnapshot snapshot) {
      setState(() {
        nama = snapshot.data["nama"];
        position = snapshot.data["position"];
      });
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        // leading: Icon(Icons.home),
        centerTitle: true,
        title: Text(
          "WIKA MAINTENANCE",
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.60,
        child: Drawer(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("User : $nama"),
                accountEmail: Text("Divisi : $position"),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ListTile(
                    title: Text("Logout"),
                    trailing: Icon(Icons.exit_to_app),
                    onTap: () async {
                      await AuthServices.signOut();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Container(
        child: new ListView(
          children: <Widget>[
            Container(
              // color: Colors.black,
              height: MediaQuery.of(context).size.height * 0.21,
              width: MediaQuery.of(context).size.width * 0.80,
              margin: EdgeInsets.all(10),

              child: Column(children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      // color: Colors.white,
                      padding: EdgeInsets.fromLTRB(0, 10.0, 5.0, 0),
                      child: Image.asset(
                        "img/logo_wika1.png",
                        height: MediaQuery.of(context).size.height * 0.10,
                        width: MediaQuery.of(context).size.width * 0.40,
                      ),
                    ),
                    Container(
                      // color: Colors.white,
                      padding: EdgeInsets.fromLTRB(0, 10.0, 10.0, 0),
                      child: Image.asset(
                        "img/logo_industri.png",
                        height: MediaQuery.of(context).size.height * 0.10,
                        width: MediaQuery.of(context).size.width * 0.40,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      // color: Colors.white,
                      margin: EdgeInsets.only(top: 5.0, bottom: 20.0),
                      child: Text(
                        "Pabrik Fabrikasi Baja Majalengka",
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width * 0.40,
                        height: MediaQuery.of(context).size.height * 0.20,
                        child: new FlatButton(
                          padding: EdgeInsets.all(0),
                          color: Colors.lightBlueAccent[100],
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return MainList();
                            }));
                          },
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 50.0,
                                child: Image.asset(
                                  "img/MaintenanceIcon8.png",
                                  height: 40.0,
                                  width: 40.0,
                                ),
                                padding: EdgeInsets.all(10.0),
                              ),
                              new Container(
                                  child: Text(
                                "MAINTENANCE",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 10,
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
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width * 0.40,
                        height: MediaQuery.of(context).size.height * 0.20,
                        child: new FlatButton(
                          padding: EdgeInsets.all(0),
                          color: Colors.lightBlueAccent[100],
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Prosedur();
                            }));
                          },
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 50.0,
                                child: Image.asset(
                                  "img/DocumentIcon8.png",
                                  height: 40.0,
                                  width: 40.0,
                                ),
                                padding: EdgeInsets.all(10.0),
                              ),
                              new Container(
                                  child: Text(
                                "PROCEDURE",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 10,
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
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width * 0.40,
                        height: MediaQuery.of(context).size.height * 0.20,
                        child: new FlatButton(
                          padding: EdgeInsets.all(0),
                          color: Colors.lightBlueAccent[100],
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Document1(
                                documentNum: 1,
                              );
                            }));
                          },
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 50.0,
                                child: Image.asset(
                                  "img/InstructionIcon8.png",
                                  height: 40.0,
                                  width: 40.0,
                                ),
                                padding: EdgeInsets.all(10.0),
                              ),
                              new Container(
                                  child: Text(
                                "WORK INSTRUCTION",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 10,
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
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width * 0.40,
                        height: MediaQuery.of(context).size.height * 0.20,
                        child: new FlatButton(
                          padding: EdgeInsets.all(0),
                          color: Colors.lightBlueAccent[100],
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Tools();
                            }));
                          },
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 50.0,
                                child: Image.asset(
                                  "img/ToolIcon8.png",
                                  height: 40.0,
                                  width: 40.0,
                                ),
                                padding: EdgeInsets.all(10.0),
                              ),
                              new Container(
                                  child: Text(
                                "TOOLS",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 10,
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
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width * 0.40,
                        height: MediaQuery.of(context).size.height * 0.20,
                        child: new FlatButton(
                          padding: EdgeInsets.all(0),
                          color: Colors.lightBlueAccent[100],
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Barcode();
                            }));
                          },
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 50.0,
                                child: Image.asset(
                                  "img/qr-code.png",
                                  height: 40.0,
                                  width: 40.0,
                                ),
                                padding: EdgeInsets.all(10.0),
                              ),
                              new Container(
                                  child: Text(
                                "SCAN BARCODE",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 10,
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
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width * 0.40,
                        height: MediaQuery.of(context).size.height * 0.20,
                        child: new FlatButton(
                          padding: EdgeInsets.all(0),
                          color: Colors.lightBlueAccent[100],
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return JenisMesinLaporan(widget.user.uid);
                            }));
                          },
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 50.0,
                                child: Image.asset(
                                  "img/ReportIcon8.png",
                                  height: 40.0,
                                  width: 40.0,
                                ),
                                padding: EdgeInsets.all(10.0),
                              ),
                              new Container(
                                  child: Text(
                                "REPORT",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 10,
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
