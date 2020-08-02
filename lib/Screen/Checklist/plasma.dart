import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Services/database.dart';

class Plasma extends StatefulWidget {
  static const String routeName = "/annual";
  final String value;
  final String hasil;
  Plasma({this.hasil, this.value});
  @override
  _PlasmaState createState() => _PlasmaState();
}

class _PlasmaState extends State<Plasma> {
  bool a = false;
  bool b = false;
  bool c = false;
  bool d = false;

  DatabaseService db = DatabaseService();
  String nama = "";
  String error = "";
  String checklist = "Daily-Plasma";
  String mesin = "AMG";
  final CollectionReference pengguna = Firestore.instance.collection('data');

  DateTime _dueDate = DateTime.now();
  String _dateText = '';
  String _timeText = '';
  String dokumen = '';

  @override
  Widget build(BuildContext context) {
    double lebar = MediaQuery.of(context).size.width;
    return new MaterialApp(
      home: new Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: new AppBar(
          title: const Text(
            'Plasma Checklist',
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(5, 15, 5, 5),
                padding: EdgeInsets.only(left: lebar * 0.05),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: lebar * 0.6,
                      child: Text(widget.hasil),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: lebar * 0.15,
                      child: Text("Ya"),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: lebar * 0.15,
                      child: Text("Tidak"),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                padding: EdgeInsets.only(left: lebar * 0.05),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: lebar * 0.60,
                      child: Text("Tekanan Regulator Angin Kompresor"),
                    ),
                    Container(
                      width: lebar * 0.15,
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
                      width: lebar * 0.15,
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
                padding: EdgeInsets.only(left: lebar * 0.05),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: lebar * 0.60,
                      child: Text(
                          "Tekanan Regulator Angin Kompresor saat Cutflow Test"),
                    ),
                    Container(
                      width: lebar * 0.15,
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
                      width: lebar * 0.15,
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
                padding: EdgeInsets.only(left: lebar * 0.05),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: lebar * 0.60,
                      child: Text("Filters Udara Mesin"),
                    ),
                    Container(
                      width: lebar * 0.15,
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
                      width: lebar * 0.15,
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
                padding: EdgeInsets.only(left: lebar * 0.05),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: lebar * 0.60,
                      child: Text("Level Coolant"),
                    ),
                    Container(
                      width: lebar * 0.15,
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
                      width: lebar * 0.15,
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
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: lebar * 0.1, right: lebar * 0.1),
                  child: RaisedButton(
                      color: Colors.lightBlueAccent,
                      child: Text("Submit",
                          style: TextStyle(
                              color: Colors.white38.withOpacity(0.8))),
                      onPressed: () async {
                        _dateText =
                            "${_dueDate.day}/${_dueDate.month}/${_dueDate.year}";
                        _timeText =
                            "${_dueDate.hour}:${_dueDate.minute}:${_dueDate.second}";
                        dokumen =
                            "${_dueDate.day}-${_dueDate.month}-${_dueDate.year}";
                        var firebaseUser =
                            await FirebaseAuth.instance.currentUser();
                        var nama =
                            await pengguna.document(firebaseUser.uid).get();
                        await db.createAddPlasma(
                            nama["nama"],
                            a,
                            b,
                            c,
                            d,
                            widget.hasil,
                            checklist,
                            _dateText,
                            _timeText,
                            mesin,
                            dokumen);
                        Navigator.pop(context);
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget list(String ket, bool nilai) {
  //   double lebar = MediaQuery.of(context).size.width;
  //   return Container(
  //     margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
  //     padding: EdgeInsets.only(left: lebar * 0.05),
  //     child: Row(
  //       children: <Widget>[
  //         Container(
  //           width: lebar * 0.60,
  //           child: Text(ket),
  //         ),
  //         Container(
  //           width: lebar * 0.15,
  //           child: Checkbox(
  //               value: nilai,
  //               onChanged: (bool value) {
  //                 print(value);
  //                 setState(() {
  //                   nilai = value;
  //                 });
  //               }),
  //         ),
  //         Container(
  //           width: lebar * 0.15,
  //           child: Checkbox(
  //               value: !nilai,
  //               onChanged: (bool value) {
  //                 print(value);
  //                 setState(() {
  //                   nilai = !value;
  //                 });
  //               }),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
