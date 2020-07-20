import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/laporan/harian.dart';
import 'package:maintenance_apps/Screen/laporan/pilihan.dart';
import 'package:maintenance_apps/Services/database.dart';
import 'package:maintenance_apps/models/user.dart';
import 'package:maintenance_apps/shared/loading.dart';

class Laporan extends StatefulWidget {
  final String id;
  Laporan(this.id);
  @override
  _LaporanState createState() => _LaporanState();
}

class _LaporanState extends State<Laporan> {
  final DatabaseService databaseService = DatabaseService();
  List<DocumentSnapshot> document;
  User user;
  @override
  void initState() {
    getUser();
    super.initState();
  }

  getUser() async {
    DocumentSnapshot data = await database.getData(widget.id);
    user = User.fromSnapshot(data);
  }

  Future<QuerySnapshot> getMesin() {
    return databaseService.getMesin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "REPORT",
          style: TextStyle(fontSize: 16.0),
        ),
      ),
      backgroundColor: Colors.blue[100],
      body: FutureBuilder<QuerySnapshot>(
          future: getMesin(),
          builder: (builder, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: Loading());
            } else {
              document = snapshot.data.documents;
              return ListView.builder(
                  itemCount: document.length,
                  itemBuilder: (context, index) {
                    String nama = document[index].data['nama'];
                    return RaisedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return PilihanLaporan(document[index], user.nama);
                        }));
                      },
                      child: Text(nama),
                    );
                  });
            }
          }),
    );
  }
}
