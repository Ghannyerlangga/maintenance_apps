import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:maintenance_apps/Services/database_ficep.dart';
import 'package:maintenance_apps/shared/cheklist.dart';
import 'package:maintenance_apps/shared/header_checklist.dart';

class Monthly extends StatefulWidget {
  final String value;
  final String hasil;
  Monthly({this.hasil, this.value});
  @override
  _MonthlyState createState() => _MonthlyState();
}

class _MonthlyState extends State<Monthly> {
  bool a, b, c, d, e, f, g, h, i = false;
  DatabaseFicep db = DatabaseFicep();
  String nama = "";
  String error = "";
  String checklist = "Monthly";
  String mesin = "FICEP";

  final CollectionReference pengguna = Firestore.instance.collection("data");

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
                child: ListView(children: <Widget>[
              HeaderChecklist(judul: widget.hasil),
              Checklist(
                kata: "Pelumasan Gantry Wheels",
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
                kata: "Pengecekan Tightening Adjustments",
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
                kata: "Periksa Level Pelumas Drill/Bor",
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
                kata: "Pemeriksaan Tightening Kamera",
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
                kata: "Pemeriksaan Proximity Transducers",
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
                kata: "Pemeriksaan Limit Switches",
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
              Checklist(
                kata: "Pemeriksaan Konektor dan Terminal",
                nilai: g,
                onChanged: (value) {
                  setState(() {
                    g = value;
                  });
                },
                onChanged2: (value) {
                  setState(() {
                    g = !value;
                  });
                },
              ),
              Checklist(
                kata: "Pemeriksaan Pengencangan Pipa ",
                nilai: h,
                onChanged: (value) {
                  setState(() {
                    h = value;
                  });
                },
                onChanged2: (value) {
                  setState(() {
                    h = !value;
                  });
                },
              ),
              Checklist(
                kata:
                    "Pemeriksaan Keausan Pipa Fleksibel pada Hidrolik dan Pelumasan Sistem",
                nilai: i,
                onChanged: (value) {
                  setState(() {
                    i = value;
                  });
                },
                onChanged2: (value) {
                  setState(() {
                    i = !value;
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
                            g,
                            h,
                            i,
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
            ]))));
  }
}
