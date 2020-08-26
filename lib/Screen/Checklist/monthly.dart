import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Services/database.dart';
import 'package:maintenance_apps/shared/cheklist.dart';

class Monthly extends StatefulWidget {
  static const String routeName = "/monthly";
  final String value;
  final String hasil;
  Monthly({this.hasil, this.value});
  @override
  _MonthlyState createState() => _MonthlyState();
}

class _MonthlyState extends State<Monthly> {
  bool a = false;
  bool b = false;
  bool c = false;
  bool d = false;
  bool e = false;
  bool f = false;

  DatabaseService db = DatabaseService();
  String nama = "";
  String error = "";
  String checklist = "Monthly";
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
          centerTitle: true,
          title: Text(
            'Monthly Checklist'.toUpperCase(),
          ),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: lebar * 0.05),
                margin: EdgeInsets.fromLTRB(5, 15, 5, 5),
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
              Checklist(
                kata: "Lubricating Rack & Ponion",
                nilai: a,
                onChanged: (value) {
                  setState(() {
                    a = value;
                  });
                },
                onChanged2: (value) {
                  setState(() {
                    a = !value;
                  });
                },
              ),
              Checklist(
                kata: "Inspect All Gas Hoes",
                nilai: b,
                onChanged: (value) {
                  setState(() {
                    b = value;
                  });
                },
                onChanged2: (value) {
                  setState(() {
                    b = !value;
                  });
                },
              ),
              Checklist(
                kata: "Inspect and Lubricate Z-Axis",
                nilai: c,
                onChanged: (value) {
                  setState(() {
                    c = value;
                  });
                },
                onChanged2: (value) {
                  setState(() {
                    c = !value;
                  });
                },
              ),
              Checklist(
                kata: "Coolant Fan Filter",
                nilai: d,
                onChanged: (value) {
                  setState(() {
                    d = value;
                  });
                },
                onChanged2: (value) {
                  setState(() {
                    d = !value;
                  });
                },
              ),
              Checklist(
                kata: "Lubricating Clamp",
                nilai: e,
                onChanged: (value) {
                  setState(() {
                    e = value;
                  });
                },
                onChanged2: (value) {
                  setState(() {
                    e = !value;
                  });
                },
              ),
              Checklist(
                kata: "Dust Proof Baffle",
                nilai: f,
                onChanged: (value) {
                  setState(() {
                    f = value;
                  });
                },
                onChanged2: (value) {
                  setState(() {
                    f = !value;
                  });
                },
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
                        await db.createAddMonthly(
                            nama["nama"],
                            a,
                            b,
                            c,
                            d,
                            e,
                            f,
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
