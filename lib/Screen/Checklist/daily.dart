import 'package:flutter/material.dart';

class Daily extends StatefulWidget {
  String value;
  String hasil;
  Daily({this.value, this.hasil});
  static const String routeName = "/daily";
  @override
  _DailyState createState() => _DailyState();
}

class _DailyState extends State<Daily> {
  bool checkBoxValue = false;
  bool checkBoxValue2 = false;
  bool checkBoxValue3 = false;
  bool checkBoxValue4 = false;
  bool checkBoxValue5 = false;
  bool checkBoxValue6 = false;
  bool checkBoxValue7 = false;
  bool checkBoxValue8 = false;
  bool checkBoxValue9 = false;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: new AppBar(
          title: const Text('Daily Checklist'),
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
                      child: Text(widget.hasil),
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
                      child: Text("Rail Cleaning"),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: checkBoxValue,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              checkBoxValue = value;
                            });
                          }),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: !checkBoxValue,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              checkBoxValue = !value;
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
                      child: Text("Machine Cleaning"),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: checkBoxValue2,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              checkBoxValue2 = value;
                            });
                          }),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: !checkBoxValue2,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              checkBoxValue2 = !value;
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
                      child: Text("Limit Switch Inspection"),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: checkBoxValue3,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              checkBoxValue3 = value;
                            });
                          }),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: !checkBoxValue3,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              checkBoxValue3 = !value;
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
                      child: Text("Linear Guide Cleaning"),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: checkBoxValue4,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              checkBoxValue4 = value;
                            });
                          }),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: !checkBoxValue4,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              checkBoxValue4 = !value;
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
                      child: Text("Cable Chain Inspection"),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: checkBoxValue5,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              checkBoxValue5 = value;
                            });
                          }),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: !checkBoxValue5,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              checkBoxValue5 = !value;
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
                      child: Text("Nozzle Cleaning"),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: checkBoxValue6,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              checkBoxValue6 = value;
                            });
                          }),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: !checkBoxValue6,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              checkBoxValue6 = !value;
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
                      child: Text("Oxygen Inspection (O2)"),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: checkBoxValue7,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              checkBoxValue7 = value;
                            });
                          }),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: !checkBoxValue7,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              checkBoxValue7 = !value;
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
                      child: Text("Elpiji Inspection (C3H8)"),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: checkBoxValue8,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              checkBoxValue8 = value;
                            });
                          }),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: !checkBoxValue8,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              checkBoxValue8 = !value;
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
                      child: Text("Nitrogen Inspection (N2)"),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: checkBoxValue9,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              checkBoxValue9 = value;
                            });
                          }),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Checkbox(
                          value: !checkBoxValue9,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              checkBoxValue9 = !value;
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
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
              Container(
                child: Column(children: <Widget>[
                  // Text(checkBoxValue2.toString()),

                  Text(checkBoxValue.toString()),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
