import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Services/database.dart';
import 'package:maintenance_apps/shared/cheklist.dart';
import 'package:maintenance_apps/shared/header_checklist.dart';

class Annual extends StatefulWidget {
  final String hasil;
  final String value;
  Annual({this.value, this.hasil});
  static const String routeName = "/annual";
  @override
  _AnnualState createState() => _AnnualState();
}

class _AnnualState extends State<Annual> {
  bool a, b = false;

  DatabaseService db = DatabaseService();
  String checklist = "Semi-Annual";
  String nama = "";
  String error = "";
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
            'Annual Checklist'.toUpperCase(),
          ),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              HeaderChecklist(judul: widget.hasil),
              Checklist(
                kata: "Remote Control Battery",
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
                kata: "Machine 90° Angle Adjustment",
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
                        await db
                            .createAddAnnual(nama["nama"], a, b, widget.hasil,
                                checklist, _dateText, _timeText, mesin, dokumen)
                            .then((value) => print("Berhasil"))
                            .catchError((error) {
                          print("Gagal");
                        });
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
}
