import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/laporan/list_mesin.dart';
import 'package:maintenance_apps/Services/database.dart';
import 'package:maintenance_apps/models/user.dart';
import 'package:maintenance_apps/shared/button_type.dart';
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
                  ButtonList(
                    type: "AMG",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ListMesin("AMG", userData)));
                    },
                  ),
                  ButtonList(
                    type: "CORYMPEX",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ListMesin("CORYMPEX", userData)));
                    },
                  ),
                  ButtonList(
                    type: "FICEP",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ListMesin("FICEP", userData)));
                    },
                  ),
                ],
              ),
            );
          },
        ));
  }
}
