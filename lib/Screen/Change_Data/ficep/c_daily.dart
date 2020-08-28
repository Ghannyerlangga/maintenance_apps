import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Services/database_ficep.dart';
import 'package:maintenance_apps/shared/cheklist.dart';
import 'package:maintenance_apps/shared/header_checklist.dart';

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
  DatabaseFicep db = DatabaseFicep();
  Future getData() async {
    final DocumentReference doc = Firestore.instance
        .collection("checklist")
        .document(widget.jenis + "-" + widget.check + "-" + widget.dokumen);
    await doc.get().then((DocumentSnapshot snapshot) async {
      setState(() {
        a = snapshot.data["kerak rel"];
        b = snapshot.data["sliding guides"];
        c = snapshot.data["thermal cutting"];
        d = snapshot.data["photocells"];
        e = snapshot.data["reflektor"];
        f = snapshot.data["proximity tranducers"];
        g = snapshot.data["limit switches"];
        h = snapshot.data["scraps plasma"];
        i = snapshot.data["kerak plasma"];
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
                kata: "Membersihkan Kerak dari Rel",
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
                kata: "Membersihkan Sliding Guides",
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
                kata: "Membersihkan Thermal Cutting Banch",
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
                kata: "Membersihkan Photocells",
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
                kata: "Membersihkan Reflektor",
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
                kata: "Membersihkan Proximity Tranducers",
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
                kata: "Membersihkan Limit Switches",
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
                kata: "Membersihkan Scraps Oxycutting/Plasma",
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
                kata: "Membersihkan Kerak dan Debu Oxycutting/Plasma",
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
}
