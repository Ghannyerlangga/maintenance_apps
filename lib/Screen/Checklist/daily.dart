import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/maintenance.dart';

class Daily extends StatefulWidget {
  static const String routeName = "/daily";
  @override
  _DailyState createState() => _DailyState();
}

class _DailyState extends State<Daily> {
  
   bool checkBoxValue = true;
   bool checkBoxValue2 = false;
   bool a1 = true;
   bool a2 = false;

   
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Daily Checklist'),
        ),
                body: Container(
          child: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Text('Apakah hari ini sudah dicek?'),
                  ),
                  Checkbox(
                      value: checkBoxValue,
                      onChanged: (bool value2) {
                        print(value2);

                        setState(() {
                          checkBoxValue = value2;
                          checkBoxValue2 = false;
                        });
                      }),
                  Text("Ya"),
                  Checkbox(
                      value: checkBoxValue2,
                      onChanged: (bool value1) {
                        print(value1);

                        setState(() {
                          checkBoxValue2 = value1;
                          checkBoxValue = false;
                        });
                      }),
                  Text("Tidak"),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Text('Apakah hari ini sudah dicek?'),
                  ),
                  Checkbox(
                      value: a1,
                      onChanged: (bool value1) {
                        print(value1);

                        setState(() {
                          a1 = value1;
                          a2 = false;
                        });
                      }),
                  Text("Ya"),
                  Checkbox(
                      value: a2,
                      onChanged: (bool value2) {
                        print(value2);

                        setState(() {
                          a2 = value2;
                          a1 = false;
                        });
                      }),
                  Text("Tidak"),
                ],
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
                      Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Maintenance();
                              }));
                    }),
              ),
            ],
          ),
        ),
),
    );
  }
}