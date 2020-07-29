import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Services/database.dart';

class ChangeAnnual extends StatefulWidget {
  final String check;
  final String jenis;
  final String waktu;
  final String dokumen;
  ChangeAnnual({this.dokumen, this.check, this.waktu, this.jenis});
  @override
  _ChangeAnnualState createState() => _ChangeAnnualState();
}

class _ChangeAnnualState extends State<ChangeAnnual> {
  DateTime _dueDate = DateTime.now();
  String _dateText = '';
  String _timeText = '';
  String dokumen = '';
  String checklist = '';
  String mesin = '';
  bool a = false;
  bool b = false;
  DatabaseService db = DatabaseService();
  Future getData() async {
    final DocumentReference doc = Firestore.instance
        .collection("checklist")
        .document(widget.jenis + "-" + widget.check + "-" + widget.dokumen);
    await doc.get().then((DocumentSnapshot snapshot) async {
      setState(() {
        a = snapshot.data["remote control"];
        b = snapshot.data["machine angle"];
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
                padding: EdgeInsets.only(left: lebar * 0.05),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: lebar * 0.65,
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
              list("Remote Control Battery", a),
              list("Machine 90° Angle Adjustment", b),
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
                        await db.createUpdateAnnual(
                            nama["nama"],
                            a,
                            b,
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

  Widget list(String ket, bool nilai) {
    double lebar = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
      padding: EdgeInsets.only(left: lebar * 0.05),
      child: Row(
        children: <Widget>[
          Container(
            width: lebar * 0.60,
            child: Text(ket),
          ),
          Container(
            width: lebar * 0.15,
            child: Checkbox(
                value: nilai,
                onChanged: (bool value) {
                  print(value);
                  setState(() {
                    nilai = value;
                  });
                }),
          ),
          Container(
            width: lebar * 0.15,
            child: Checkbox(
                value: !nilai,
                onChanged: (bool value) {
                  print(value);
                  setState(() {
                    nilai = !value;
                  });
                }),
          ),
        ],
      ),
    );
  }
}
