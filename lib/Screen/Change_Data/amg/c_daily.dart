import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Services/database.dart';

class ChangeDaily extends StatefulWidget {
  final String check;
  final String jenis;
  final String waktu;
  final String dokumen;
  ChangeDaily({this.dokumen, this.check, this.waktu, this.jenis});
  @override
  _ChangeDailyState createState() => _ChangeDailyState();
}

class _ChangeDailyState extends State<ChangeDaily> {
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
  bool g = false;
  bool h = false;
  bool i = false;
  DatabaseService db = DatabaseService();
  Future getData() async {
    final DocumentReference doc = Firestore.instance
        .collection("checklist")
        .document(widget.jenis + "-" + widget.check + "-" + widget.dokumen);
    await doc.get().then((DocumentSnapshot snapshot) async {
      setState(() {
        a = snapshot.data["rail"];
        b = snapshot.data["machine"];
        c = snapshot.data["limit switch"];
        d = snapshot.data["linear guide"];
        e = snapshot.data["cable chain"];
        f = snapshot.data["nozzle"];
        g = snapshot.data["oxygen"];
        h = snapshot.data["elpiji"];
        i = snapshot.data["nitrogen"];
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
                      width: lebar * 0.6,
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
              list("Rail Cleaning", a),
              list("Machine Cleaning", b),
              list("Limit Switch Inspection", c),
              list("Linear Guide Cleaning", d),
              list("Cable Chain Inspection", e),
              list("Nozzle Cleaning", f),
              list("Oxygen Inspection (O2)", g),
              list("Elpiji Inspection (C3H8)", h),
              list("Nitrogen Inspection (N2)", i),
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
