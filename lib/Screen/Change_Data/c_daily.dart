import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Services/database.dart';

class DailyChange extends StatefulWidget {
  final String value;
  final String hasil;
  final String waktu;
  DailyChange({this.value, this.hasil, this.waktu});
  static const String routeName = "/daily";
  @override
  _DailyChangeState createState() => _DailyChangeState();
}

class _DailyChangeState extends State<DailyChange> {
  DatabaseService db = DatabaseService();
  String nama = "";
  String error = "";
  String checklist = "Daily";
  bool a;
  bool b;
  bool c;
  bool d;
  bool e;
  bool f;
  bool g;
  bool h;
  bool i;
  String coba;

  final CollectionReference pengguna = Firestore.instance.collection('data');
  @override
  void initState() {
    _fetch();
    super.initState();
  }

  final CollectionReference data = Firestore.instance.collection('checklist');

  // .getDocuments();

  void _fetch() async {
    await data
        .where("waktu", isEqualTo: widget.waktu)
        .where("jenis mesin", isEqualTo: widget.value)
        .where("checklist", isEqualTo: widget.hasil)
        .getDocuments()
        .then((value) {
      if (value.documents.isNotEmpty) {
        setState(() {
          Map<String, dynamic> documentData = value.documents.single.data;
          // var anu = documentData["rail"];
          // a = anu;
          // b = documentData["machine"];
          // c = documentData["limit switch"];
          // d = documentData["linear guide"];
          // e = documentData["cable chain"];
          // f = documentData["nozzle"];
          // g = documentData["oxygen"];
          // h = documentData["elpiji"];
          // i = documentData["nitrogen"];
        });
      }
    }).catchError((e) => print("Error Fetching Data: $e"));
  }

  DateTime _dueDate = DateTime.now();
  String _dateText = '';
  String _timeText = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: new AppBar(
          title: const Text(
            'Daily Checklist',
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(5, 15, 5, 5),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Text(widget.hasil),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Text("Ya"),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Text("Tidak"),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Text("Rail Cleaning"),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: a,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              a = value;
                            });
                          }),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: !a,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              a = !value;
                            });
                          }),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Text("Machine Cleaning"),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: b,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              b = value;
                            });
                          }),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: !b,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              b = !value;
                            });
                          }),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Text("Limit Switch Inspection"),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: c,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              c = value;
                            });
                          }),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: !c,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              c = !value;
                            });
                          }),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Text("Linear Guide Cleaning"),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: d,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              d = value;
                            });
                          }),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: !d,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              d = !value;
                            });
                          }),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Text("Cable Chain Inspection"),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: e,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              e = value;
                            });
                          }),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: !e,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              e = !value;
                            });
                          }),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Text("Nozzle Cleaning"),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: f,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              f = value;
                            });
                          }),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: !f,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              f = !value;
                            });
                          }),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Text("Oxygen Inspection (O2)"),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: g,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              g = value;
                            });
                          }),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: !g,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              g = !value;
                            });
                          }),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Text("Elpiji Inspection (C3H8)"),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: h,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              h = value;
                            });
                          }),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: !h,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              h = !value;
                            });
                          }),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Text("Nitrogen Inspection (N2)"),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: i,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              i = value;
                            });
                          }),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: !i,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              i = !value;
                            });
                          }),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: RaisedButton(
                    color: Colors.lightBlueAccent,
                    child: Text("Submit",
                        style:
                            TextStyle(color: Colors.white38.withOpacity(0.8))),
                    onPressed: () async {
                      _dateText =
                          "${_dueDate.day}/${_dueDate.month}/${_dueDate.year}";
                      _timeText =
                          "${_dueDate.hour}:${_dueDate.minute}:${_dueDate.second}";
                      var firebaseUser =
                          await FirebaseAuth.instance.currentUser();
                      var nama =
                          await pengguna.document(firebaseUser.uid).get();
                      await db.createUpdateDaily(
                          nama["nama"],
                          a,
                          b,
                          c,
                          d,
                          e,
                          f,
                          g,
                          h,
                          i,
                          widget.hasil,
                          checklist,
                          _dateText,
                          _timeText);
                      Navigator.pop(context);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}