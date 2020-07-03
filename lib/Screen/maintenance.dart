import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/Checklist/daily.dart';
import 'package:maintenance_apps/Screen/Checklist/monthly.dart';
import 'package:maintenance_apps/Screen/Checklist/weekly.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  String foos = 'One';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      initialRoute: '/',
      routes: {
        Daily.routeName: (context) => Daily(),
        Weekly.routeName: (context) => Weekly(),
        Monthly.routeName: (context) => Monthly(),
      },
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Daftar Mesin'),
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
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    _buildAboutDialog(
                                        x.data["jenis"], x.data["nama"]));
                          },
                        );
                      });
                }
              }),
        ),
      ),
    );
  }

  Widget _buildAboutDialog(String value, String hasil) {
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
              Container(height: 3.0,
                  color: Colors.black87,),
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
                      onPressed: () {
                        switch (value) {
                          case "AMG":
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Daily(value: value, hasil: hasil),
                                ));
                            break;
                          case "FICEP":
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Monthly();
                            }));
                            break;
                          default:
                        }
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
                        switch (value) {
                          case "AMG":
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Monthly(value: value, hasil: hasil),
                                ));
                            break;
                          case "FICEP":
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Monthly();
                            }));
                            break;
                          default:
                        }
                      },
                      child: Text(
                        "Weekly",
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
    // return new AlertDialog(
    //   title: const Text(
    //     'Pilih Checklist',
    //     style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),
    //   ),
    //   content: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: <Widget>[
    //         ButtonTheme(
    //           minWidth: 30.0,
    //           child: RaisedButton(
    //             onPressed: () {
    //               Navigator.pop(context);
    //               Navigator.push(context, MaterialPageRoute(builder: (context) {
    //                 return Daily();
    //               }));
    //             },
    //             textColor: Theme.of(context).accentColor,
    //             child: const Text('Daily'),
    //           ),
    //         ),
    //         ButtonTheme(
    //           minWidth: 30.0,
    //           child: RaisedButton(
    //             onPressed: () {
    //               Navigator.pushReplacementNamed(context, Daily.routeName);
    //               // Navigator.pop(context);
    //               // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //               //   return Weekly();
    //               // }));
    //             },
    //             textColor: Theme.of(context).primaryColor,
    //             child: const Text('Weekly'),
    //           ),
    //         ),
    //         ButtonTheme(
    //           minWidth: 30.0,
    //           child: RaisedButton(
    //             onPressed: () {
    //               Navigator.pop(context);
    //               Navigator.push(context, MaterialPageRoute(builder: (context) {
    //                 return Monthly();
    //               }));
    //             },
    //             textColor: Theme.of(context).primaryColor,
    //             child: const Text('Monthly'),
    //           ),
    //         ),
    //       ]),
    //   // actions: <Widget>[

    //   // ],
    // );
  }
}
