import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Services/database.dart';
import 'package:maintenance_apps/shared/cheklist.dart';
import 'package:maintenance_apps/shared/header_checklist.dart';

class ChangePlasma extends StatefulWidget {
  final String check;
  final String jenis;
  final String waktu;
  final String dokumen;
  ChangePlasma({this.dokumen, this.check, this.waktu, this.jenis});
  @override
  _ChangePlasmaState createState() => _ChangePlasmaState();
}

class _ChangePlasmaState extends State<ChangePlasma> {
  DateTime _dueDate = DateTime.now();
  String _dateText = '';
  String _timeText = '';
  String dokumen = '';
  String checklist = '';
  String mesin = '';
  bool a = false;
  bool b = false;
  bool c = false;
  bool d = false;
  DatabaseService db = DatabaseService();
  Future getData() async {
    final DocumentReference doc = Firestore.instance
        .collection("checklist")
        .document(widget.jenis + "-" + widget.check + "-" + widget.dokumen);
    await doc.get().then((DocumentSnapshot snapshot) async {
      setState(() {
        a = snapshot.data["tekanan angin"];
        b = snapshot.data["tekanan angin cutflow"];
        c = snapshot.data["filter udara"];
        d = snapshot.data["level coolant"];
        mesin = snapshot.data["mesin"];
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
    double lebar = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: new Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: new AppBar(
          centerTitle: true,
          title: Text(
            'Daily Checklist'.toUpperCase(),
          ),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              HeaderChecklist(judul: widget.jenis),
              SizedBox(height: size.height * 0.02),
              Checklist(
                kata: "Tekanan Regulator Angin Kompresor",
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
                kata: "Tekanan Regulator Angin Kompresor saat Cutflow Test",
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
                kata: "Filter Udara Mesin",
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
                kata: "Level Coolant",
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
                        dokumen = widget.dokumen;
                        checklist = widget.check;
                        var firebaseUser =
                            await FirebaseAuth.instance.currentUser();
                        var nama = await db.myCollection
                            .document(firebaseUser.uid)
                            .get();
                        await db.createUpdatePlasma(
                            nama["nama"],
                            a,
                            b,
                            c,
                            d,
                            widget.jenis,
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
