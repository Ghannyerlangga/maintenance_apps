import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/Checklist/annual.dart';
import 'package:maintenance_apps/Screen/Checklist/daily.dart';
import 'package:maintenance_apps/Screen/Checklist/monthly.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maintenance_apps/Screen/Checklist/plasma.dart';
import 'package:maintenance_apps/Screen/change_data.dart';
import 'package:maintenance_apps/shared/loading.dart';

class Maintenance extends StatefulWidget {
  static const String routeName = "/maintenance";
  @override
  MaintenanceState createState() => new MaintenanceState();
}

class MaintenanceState extends State<Maintenance> {
  Future getData() async {
    var firestore = Firestore.instance;

    QuerySnapshot qn = await firestore.collection("mesin").getDocuments();
    return qn.documents;
  }

  String jenis = "";
  String nama = "";

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      initialRoute: '/',
      routes: {
        Daily.routeName: (context) => Daily(),
        Plasma.routeName: (context) => Plasma(),
        Monthly.routeName: (context) => Monthly(),
        Annual.routeName: (context) => Annual(),
      },
      home: new Scaffold(
        appBar: new AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back, // add custom icons also
            ),
          ),
          centerTitle: true,
          title: const Text('Daftar Mesin'),
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UbahData(),
                      ));
                },
                icon: Icon(Icons.check),
                label: Text("Edit"))
          ],
        ),
        backgroundColor: Colors.blue[100],
        body: Container(
          child: FutureBuilder(
              future: getData(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Loading(),
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (_, index) {
                        final x = snapshot.data[index];
                        return ListTile(
                          leading: Icon(Icons.assignment),
                          title: Text(x.data["nama"]),
                          subtitle: Text("Jenis Mesin : ${x.data["jenis"]}"),
                          onTap: () {
                            switch (x.data["jenis"]) {
                              case "AMG":
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        _buildAboutDialog(
                                            x.data["jenis"], x.data["nama"]));
                                break;
                              case "FICEP":
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        _buildAboutDialog2(
                                            x.data["jenis"], x.data["nama"]));
                                break;
                              case "CORYMPEX":
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        _buildAboutDialog3(
                                            x.data["jenis"], x.data["nama"]));
                                break;
                              case "DAITO":
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        _buildAboutDialog4(
                                            x.data["jenis"], x.data["nama"]));
                                break;
                              default:
                            }
                          },
                        );
                      });
                }
              }),
        ),
      ),
    );
  }

  _buildAboutDialog(String value, String hasil) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      "Maintenance AMG : CNC Cutting Machine",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120.0,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Daily(value: value, hasil: hasil),
                            ));
                      },
                      child: Text(
                        "Daily",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: const Color(0xFF1BC0C5),
                    ),
                  ),
                  SizedBox(
                    width: 120.0,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Monthly(value: value, hasil: hasil),
                            ));
                      },
                      child: Text(
                        "Monthly",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: const Color(0xFF1BC0C5),
                    ),
                  ),
                  SizedBox(
                    width: 120.0,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Annual(value: value, hasil: hasil),
                            ));
                      },
                      child: Text(
                        "Semi-Annual",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: const Color(0xFF1BC0C5),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Maintenance Plasma HyperTherm",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120.0,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Plasma(value: value, hasil: hasil),
                            ));
                      },
                      child: Text(
                        "Daily",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: const Color(0xFF1BC0C5),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildAboutDialog2(String value, String hasil) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)), //this right here
      child: Container(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      "Maintenance AMG : CNC Cutting Machine",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          shadows: [
                            Shadow(
                                color: Colors.lightBlue,
                                offset: Offset(1, 2),
                                blurRadius: 2)
                          ]),
                    ),
                  ),
                  SizedBox(
                    width: 120.0,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        "Daily",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: const Color(0xFF1BC0C5),
                    ),
                  ),
                  SizedBox(
                    width: 120.0,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        "Plasma",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: const Color(0xFF1BC0C5),
                    ),
                  ),
                  SizedBox(
                    width: 120.0,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        "Monthly",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: const Color(0xFF1BC0C5),
                    ),
                  ),
                  Container(
                    height: 3.0,
                    color: Colors.black87,
                  ),
                  Container(
                    child: Text(
                      "Maintenance Plasma HyperTherm",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          shadows: [
                            Shadow(
                                color: Colors.lightBlue,
                                offset: Offset(1, 2),
                                blurRadius: 2)
                          ]),
                    ),
                  ),
                  SizedBox(
                    width: 120.0,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        "Daily",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: const Color(0xFF1BC0C5),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildAboutDialog3(String value, String hasil) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)), //this right here
      child: Container(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Choose Checklist!"),
              Container(
                height: 3.0,
                color: Colors.black87,
              ),
              Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      "Maintenance AMG : CNC Cutting Machine",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          shadows: [
                            Shadow(
                                color: Colors.lightBlue,
                                offset: Offset(1, 2),
                                blurRadius: 2)
                          ]),
                    ),
                  ),
                  SizedBox(
                    width: 120.0,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        "Daily",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: const Color(0xFF1BC0C5),
                    ),
                  ),
                  SizedBox(
                    width: 120.0,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        "Plasma",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: const Color(0xFF1BC0C5),
                    ),
                  ),
                  SizedBox(
                    width: 120.0,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        "Monthly",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: const Color(0xFF1BC0C5),
                    ),
                  ),
                  Container(
                    height: 3.0,
                    color: Colors.black87,
                  ),
                  Container(
                    child: Text(
                      "Maintenance Plasma HyperTherm",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          shadows: [
                            Shadow(
                                color: Colors.lightBlue,
                                offset: Offset(1, 2),
                                blurRadius: 2)
                          ]),
                    ),
                  ),
                  SizedBox(
                    width: 120.0,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        "Daily",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: const Color(0xFF1BC0C5),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildAboutDialog4(String value, String hasil) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)), //this right here
      child: Container(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Choose Checklist!"),
              Container(
                height: 3.0,
                color: Colors.black87,
              ),
              Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      "Maintenance AMG : CNC Cutting Machine",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          shadows: [
                            Shadow(
                                color: Colors.lightBlue,
                                offset: Offset(1, 2),
                                blurRadius: 2)
                          ]),
                    ),
                  ),
                  SizedBox(
                    width: 120.0,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        "Daily",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: const Color(0xFF1BC0C5),
                    ),
                  ),
                  SizedBox(
                    width: 120.0,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        "Plasma",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: const Color(0xFF1BC0C5),
                    ),
                  ),
                  SizedBox(
                    width: 120.0,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        "Monthly",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: const Color(0xFF1BC0C5),
                    ),
                  ),
                  Container(
                    height: 3.0,
                    color: Colors.black87,
                  ),
                  Container(
                    child: Text(
                      "Maintenance Plasma HyperTherm",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          shadows: [
                            Shadow(
                                color: Colors.lightBlue,
                                offset: Offset(1, 2),
                                blurRadius: 2)
                          ]),
                    ),
                  ),
                  SizedBox(
                    width: 120.0,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        "Daily",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: const Color(0xFF1BC0C5),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
