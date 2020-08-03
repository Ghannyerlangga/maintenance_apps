import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/laporan/pilihan.dart';
import 'package:maintenance_apps/models/user.dart';
import 'package:maintenance_apps/shared/loading.dart';

class ListMesin extends StatefulWidget {
  final String jenisMesin;
  final User user;
  ListMesin(this.jenisMesin, this.user);
  @override
  _ListMesinState createState() => _ListMesinState();
}

class _ListMesinState extends State<ListMesin> {
  QuerySnapshot listMesin;

  // @override
  // void initState() {
  //   listMesin = _listMesin();
  //   super.initState();
  // }

  Future<QuerySnapshot> _listMesin() async {
    listMesin = await Firestore.instance
        .collection('mesin')
        .where('jenis', isEqualTo: widget.jenisMesin)
        .getDocuments();
    return listMesin;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Mesin'.toUpperCase()),
      ),
      body: FutureBuilder<QuerySnapshot>(
          future: _listMesin(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Loading();
            }
            List<DocumentSnapshot> doc = snapshot.data.documents;

            return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  final x = doc[index];
                  return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Icon(Icons.assignment),
                        title: Text(x["nama"]),
                        subtitle: Text("Jenis Mesin : ${x["jenis"]}"),
                        trailing: Text(x["lokasi"]),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) =>
                                PilihanLaporan(doc[index], widget.user.nama),
                          );
                        },
                      ));
                });
          }),
    );
  }
}
