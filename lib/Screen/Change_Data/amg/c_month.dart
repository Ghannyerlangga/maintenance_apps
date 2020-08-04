import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Services/database.dart';

class ChangeMonthly extends StatefulWidget {
  final String check;
  final String jenis;
  final String waktu;
  final String dokumen;
  ChangeMonthly({this.dokumen, this.check, this.waktu, this.jenis});
  @override
  _ChangeMonthlyState createState() => _ChangeMonthlyState();
}

class _ChangeMonthlyState extends State<ChangeMonthly> {
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
  bool e = false;
  bool f = false;
  DatabaseService db = DatabaseService();
  Future getData() async {
    final DocumentReference doc = Firestore.instance
        .collection("checklist")
        .document(widget.jenis + "-" + widget.check + "-" + widget.dokumen);
    await doc.get().then((DocumentSnapshot snapshot) async {
      setState(() {
        a = snapshot.data["rack"];
        b = snapshot.data["gas hoses"];
        c = snapshot.data["z-axis"];
        d = snapshot.data["coolant"];
        e = snapshot.data["clamp"];
        f = snapshot.data["dust"];
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
              Container(
                margin: EdgeInsets.fromLTRB(5, 15, 5, 5),
                padding: EdgeInsets.only(left: lebar * 0.05),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: lebar * 0.60,
                      child: Text(widget.jenis),
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
                      child: Text("Lubricating Rack & Ponion"),
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
                      child: Text("Inspect All Gas Hoses"),
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
                      child: Text("Inspect and Lubricate Z-Axis"),
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
                      child: Text("Coolant Fan Filter"),
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
                margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                padding: EdgeInsets.only(left: lebar * 0.05),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: lebar * 0.60,
                      child: Text("Lubricating Clamp"),
                    ),
                    Container(
                      width: lebar * 0.15,
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
                      width: lebar * 0.15,
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
                padding: EdgeInsets.only(left: lebar * 0.05),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: lebar * 0.60,
                      child: Text("Dust Proof Baffle"),
                    ),
                    Container(
                      width: lebar * 0.15,
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
                      width: lebar * 0.15,
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
                        await db.createUpdateMonthly(
                            nama["nama"],
                            a,
                            b,
                            c,
                            d,
                            e,
                            f,
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
