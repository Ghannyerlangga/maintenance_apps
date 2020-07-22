import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/Checklist/annual.dart';
import 'package:maintenance_apps/Screen/Checklist/daily.dart';
import 'package:maintenance_apps/Screen/Checklist/monthly.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maintenance_apps/Screen/Checklist/plasma.dart';
import 'package:maintenance_apps/Screen/Dialog/daito_dialog.dart';
import 'package:maintenance_apps/Screen/Dialog/ficep_dialog.dart';
import 'package:maintenance_apps/Screen/change_data.dart';
import 'package:maintenance_apps/shared/loading.dart';
import 'Dialog/amg_dialog.dart';
import 'Dialog/corympex_dialog.dart';

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
          title: const Text(
            'Daftar Mesin',
            style: TextStyle(fontSize: 16.0),
          ),
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
                                  builder: (BuildContext context) => AMGDialog(
                                      value: x.data["jenis"],
                                      hasil: x.data["nama"]),
                                );
                                break;
                              case "FICEP":
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        FicepDialog(
                                            value: x.data["jenis"],
                                            hasil: x.data["nama"]));
                                break;
                              case "CORYMPEX":
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        CorympexDialog(
                                            value: x.data["jenis"],
                                            hasil: x.data["nama"]));
                                break;
                              case "DAITO":
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        DaitoDialog(
                                            value: x.data["jenis"],
                                            hasil: x.data["nama"]));
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
}
