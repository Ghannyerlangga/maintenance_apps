import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Services/database.dart';

class Daily extends StatefulWidget {
  final String value;
  final String hasil;
  Daily({this.value, this.hasil});
  static const String routeName = "/daily";
  @override
  _DailyState createState() => _DailyState();
}

class _DailyState extends State<Daily> {
  bool a = false;
  bool b = false;
  bool c = false;
  bool d = false;
  bool e = false;
  bool f = false;
  bool g = false;
  bool h = false;
  bool i = false;
  DatabaseService db = DatabaseService();
  String nama = "";
  String error = "";
  String checklist = "Daily";
  String mesin = "AMG";

  final CollectionReference pengguna = Firestore.instance.collection('data');

  DateTime _dueDate = DateTime.now();
  String _dateText = '';
  String _timeText = '';
  String dokumen = '';

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
                padding: EdgeInsets.only(left: lebar * 0.05),
                margin: EdgeInsets.fromLTRB(5, 15, 5, 5),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: lebar * 0.60,
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
              list(context, "Rail Cleaning", a),
              list(context, "Machine Cleaning", b),
              list(context, "Limit Switch Inspection", c),
              list(context, "Linear Guide Cleaning", d),
              list(context, "Cable Chain Inspection", e),
              list(context, "Nozzle Cleaning", f),
              list(context, "Oxygen Inspection (O2)", g),
              list(context, "Elpiji Inspection (C3H8)", h),
              list(context, "Nitrogen Inspection (N2)", i),
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
                        await db.createAddDaily(
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
            ],
          ),
        ),
      ),
    );
  }

  Widget list(BuildContext context, String ket, bool nilai) {
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
                    switch (ket) {
                      case "Rail Cleaning":
                        a = value;
                        break;
                      case "Machine Cleaning":
                        b = value;
                        break;
                      case "Limit Switch Inspection":
                        c = value;
                        break;
                      case "Linear Guide Cleaning":
                        d = value;
                        break;
                      case "Cable Chain Inspection":
                        e = value;
                        break;
                      case "Nozzle Cleaning":
                        f = value;
                        break;
                      case "Oxygen Inspection (O2)":
                        g = value;
                        break;
                      case "Elpiji Inspection (C3H8)":
                        h = value;
                        break;
                      case "Nitrogen Inspection (N2)":
                        i = value;
                        break;
                    }
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
                    switch (ket) {
                      case "Rail Cleaning":
                        a = !value;
                        break;
                      case "Machine Cleaning":
                        b = !value;
                        break;
                      case "Limit Switch Inspection":
                        c = !value;
                        break;
                      case "Linear Guide Cleaning":
                        d = !value;
                        break;
                      case "Cable Chain Inspection":
                        e = !value;
                        break;
                      case "Nozzle Cleaning":
                        f = !value;
                        break;
                      case "Oxygen Inspection (O2)":
                        g = !value;
                        break;
                      case "Elpiji Inspection (C3H8)":
                        h = !value;
                        break;
                      case "Nitrogen Inspection (N2)":
                        i = !value;
                        break;
                    }
                  });
                }),
          ),
        ],
      ),
    );
  }
}
