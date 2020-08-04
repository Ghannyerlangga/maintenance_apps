import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

import 'Document/document1.dart';

class Prosedur extends StatefulWidget {
  @override
  _ProsedurState createState() => _ProsedurState();
}

class _ProsedurState extends State<Prosedur> {
  // bool _isLoading = false, _isInit = true;
  PDFDocument document;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back, // add custom icons also
              ),
            ),
            title: Text(
              "Dokumen Prosedur".toUpperCase(),
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.blue[100],
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
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
                                    "img/DocumentIcon8.png",
                                    height: 40.0,
                                    width: 40.0,
                                  ),
                                  padding: EdgeInsets.all(10.0),
                                ),
                                new Container(
                                    child: Text(
                                  "FILE PROCEDURE 1",
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
                  ]),
              // ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
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
                                  documentNum: 2,
                                );
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
                                  "FILE PROCEDURE 2",
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
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
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
                                  documentNum: 3,
                                );
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
                                  "FILE PROCEDURE 3",
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
                  ]),
            ],
          )),
    );
  }
}
