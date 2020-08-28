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
import 'package:maintenance_apps/shared/button_menu.dart';

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
    Size size = MediaQuery.of(context).size;
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
        width: size.width * 0.60,
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
              height: size.height * 0.21,
              width: size.width * 0.80,
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
                        height: size.height * 0.10,
                        width: size.width * 0.40,
                      ),
                    ),
                    Container(
                      // color: Colors.white,
                      padding: EdgeInsets.fromLTRB(0, 10.0, 10.0, 0),
                      child: Image.asset(
                        "img/logo_industri.png",
                        height: size.height * 0.10,
                        width: size.width * 0.40,
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
                  ButtonMenu(
                    padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MainList();
                      }));
                    },
                    image: "img/MaintenanceIcon8.png",
                    text: "MAINTENANCE",
                  ),
                  ButtonMenu(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Prosedur();
                      }));
                    },
                    image: "img/DocumentIcon8.png",
                    text: "PROCEDURE",
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonMenu(
                    padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Document1(
                          documentNum: 1,
                        );
                      }));
                    },
                    image: "img/InstructionIcon8.png",
                    text: "WORK INSTRUCTION",
                  ),
                  ButtonMenu(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Tools();
                      }));
                    },
                    image: "img/ToolIcon8.png",
                    text: "TOOLS",
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonMenu(
                    padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Barcode();
                      }));
                    },
                    image: "img/qr-code.png",
                    text: "SCAN QR-CODE",
                  ),
                  ButtonMenu(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return JenisMesinLaporan(widget.user.uid);
                      }));
                    },
                    image: "img/ReportIcon8.png",
                    text: "REPORT",
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
