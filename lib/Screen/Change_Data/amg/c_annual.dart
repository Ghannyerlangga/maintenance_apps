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
                      child: Text(widget.jenis),
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
                      child: Text("Remote Control Battery"),
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
                      child: Text("Machine 90' Angle Adjusment"),
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
            ],
          ),
        ),
      ),
    );
  }
}