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
  final _key = GlobalKey();
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
              Container(
                margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                padding: EdgeInsets.only(left: lebar * 0.05),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: lebar * 0.60,
                      child: Text("Rail Cleaning"),
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
                      child: Text("Machine Cleaning"),
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
                      child: Text("Limit Switch Inspection"),
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
                      child: Text("Linear Guide Cleaning"),
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
                      child: Text("Cable Chain Inspection"),
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
                      child: Text("Nozzle Cleaning"),
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
                margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                padding: EdgeInsets.only(left: lebar * 0.05),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: lebar * 0.60,
                      child: Text("Oxygen Inspection (O2)"),
                    ),
                    Container(
                      width: lebar * 0.15,
                      child: Checkbox(
                          value: g,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              g = value;
                            });
                          }),
                    ),
                    Container(
                      width: lebar * 0.15,
                      child: Checkbox(
                          value: !g,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              g = !value;
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
                      child: Text("Elpiji Inspection (C3H8)"),
                    ),
                    Container(
                      width: lebar * 0.15,
                      child: Checkbox(
                          value: h,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              h = value;
                            });
                          }),
                    ),
                    Container(
                      width: lebar * 0.15,
                      child: Checkbox(
                          value: !h,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              h = !value;
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
                      child: Text("Nitrogen Inspection (N2)"),
                    ),
                    Container(
                      width: lebar * 0.15,
                      child: Checkbox(
                          value: i,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              i = value;
                            });
                          }),
                    ),
                    Container(
                      width: lebar * 0.15,
                      child: Checkbox(
                          value: !i,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              i = !value;
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

//   Widget list(String ket, bool nilai) {
//     double lebar = MediaQuery.of(context).size.width;
//     return StatefulBuilder(
//         builder: (BuildContext context, StateSetter setState) {
//       return Container(
//         margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
//         padding: EdgeInsets.only(left: lebar * 0.05),
//         child: Row(
//           children: <Widget>[
//             Container(
//               width: lebar * 0.60,
//               child: Text(ket),
//             ),
//             Container(
//               width: lebar * 0.15,
//               child: CheckboxChange(
//                   value: nilai,
//                   onChanged: (bool value) {
//                     print(value);
//                     setState(() {
//                       nilai = value;
//                     });
//                   }),
//             ),
//             Container(
//               width: lebar * 0.15,
//               child: CheckboxChange(
//                   value: !nilai,
//                   onChanged: (bool value) {
//                     print(value);
//                     setState(() {
//                       nilai = !value;
//                     });
//                   }),
//             ),
//           ],
//         ),
//       );
//     });
//   }
}

// class CheckboxChange extends StatelessWidget {
//   final Function onChanged;
//   final bool value;
//   CheckboxChange({this.value, this.onChanged});

//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       value: value,
//       onChanged: onChanged,
//     );
//   }
// }
