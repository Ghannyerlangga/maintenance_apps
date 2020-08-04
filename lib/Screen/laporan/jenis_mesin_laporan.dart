import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/laporan/list_mesin.dart';
import 'package:maintenance_apps/Services/database.dart';
import 'package:maintenance_apps/models/user.dart';
import 'package:maintenance_apps/shared/loading.dart';

class JenisMesinLaporan extends StatefulWidget {
  final String uid;
  JenisMesinLaporan(this.uid);
  @override
  _JenisMesinLaporanState createState() => _JenisMesinLaporanState();
}

class _JenisMesinLaporanState extends State<JenisMesinLaporan> {
  DatabaseService databaseService = DatabaseService();
  User userData;

  DocumentSnapshot userSnapshot;

  @override
  initState() {
    getUser();
    super.initState();
  }

  getUser() async {
    userSnapshot = await databaseService.getData(widget.uid);
    userData = User.fromSnapshot(userSnapshot);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Daftar Mesin".toUpperCase()),
          centerTitle: true,
        ),
        body: FutureBuilder<DocumentSnapshot>(
          future: databaseService.getData(widget.uid),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Loading();
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  itemList('AMG'),
                  itemList('CORYMPEX'),
                  itemList('FICEP')
                ],
              ),
            );
          },
        ));
  }

  Widget itemList(String title) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: ButtonTheme(
          minWidth: MediaQuery.of(context).size.width * 0.40,
          height: MediaQuery.of(context).size.height * 0.20,
          child: new FlatButton(
            padding: EdgeInsets.all(0),
            color: Colors.lightBlueAccent[100],
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListMesin(title, userData)));
            },
            child: Column(
              children: <Widget>[
                Container(
                    child: Text(
                  title,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 16, color: Colors.white, shadows: [
                    Shadow(
                        color: Colors.lightBlue,
                        offset: Offset(1, 2),
                        blurRadius: 2)
                  ]),
                )),
              ],
            ),
          )),
    );
  }
}
