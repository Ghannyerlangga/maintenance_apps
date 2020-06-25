import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/Document/document1.dart';
import 'package:maintenance_apps/Screen/laporan.dart';
import 'package:maintenance_apps/Screen/maintenance.dart';
import 'package:maintenance_apps/Screen/prosedur.dart';
import 'package:maintenance_apps/Services/auth_services.dart';

class MainPage extends StatelessWidget {
  final FirebaseUser user;
  MainPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[100],
      appBar: AppBar(
        title: Text("Main Page"),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async {
                await AuthServices.signOut();
              },
              icon: Icon(Icons.exit_to_app),
              label: Text("Logout"))
        ],
      ),
      body: Container(
        child: new ListView(
          children: <Widget>[
            Container(
              height: 225.0,
              padding: EdgeInsets.all(20),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 5.0, 10.0),
                    child: Image.asset(
                      "img/logo_wika1.png",
                      height: 150,
                      width: 150,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5.0, 10.0, 10.0, 10.0),
                    child: Image.asset(
                      "img/logo_industri.png",
                      height: 150,
                      width: 150,
                    ),
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
                        minWidth: 150.0,
                        height: 100,
                        child: new FlatButton(
                          padding: EdgeInsets.all(0),
                          color: Colors.lightBlueAccent[100],
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Maintenance();
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
                        minWidth: 150.0,
                        height: 100,
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
                        minWidth: 150.0,
                        height: 100,
                        child: new FlatButton(
                          padding: EdgeInsets.all(0),
                          color: Colors.lightBlueAccent[100],
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Document1(document_num: 1,);
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
                        minWidth: 150.0,
                        height: 100,
                        child: new FlatButton(
                          padding: EdgeInsets.all(0),
                          color: Colors.lightBlueAccent[100],
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Laporan();
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
                                "ALAT",
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
                        minWidth: 150.0,
                        height: 100,
                        child: new FlatButton(
                          padding: EdgeInsets.all(0),
                          color: Colors.lightBlueAccent[100],
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Maintenance();
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
                        minWidth: 150.0,
                        height: 100,
                        child: new FlatButton(
                          padding: EdgeInsets.all(0),
                          color: Colors.lightBlueAccent[100],
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Laporan();
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
                                "LAPORAN",
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
