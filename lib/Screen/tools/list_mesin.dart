import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/laporan/harian.dart';
import 'package:maintenance_apps/Screen/tools/tambah_mesin.dart';
import 'package:maintenance_apps/models/mesin.dart';

class ListMesin extends StatefulWidget {
  final String jenisMesin;
  ListMesin(this.jenisMesin);

  @override
  _ListMesinState createState() => _ListMesinState();
}

class _ListMesinState extends State<ListMesin> {
  Stream<QuerySnapshot> data;
  List<DocumentSnapshot> document;

  Mesin mesin;

  @override
  void initState() {
    // TODO: implement initState

    data = getListMesin(widget.jenisMesin);
    super.initState();
  }

  Stream<QuerySnapshot> getListMesin(String jenisMesin) {
    return Firestore.instance
        .collection('mesin')
        .where('jenis', isEqualTo: jenisMesin)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return TambahMesin(mesin, 'tambah');
                  }));
                }),
          )
        ],
        title: Text('List Mesin'),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: data,
          builder: (builder, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            document = snapshot.data.documents;
            return ListView.builder(
                itemCount: document.length,
                itemBuilder: (contex, index) {
                  String nama = document[index].data['nama'];
                  String jenis = document[index].data['jenis'];
                  String kapasitas = document[index].data['kapasitas'];
                  String jumlah = document[index].data['jumlah'];
                  String lokasi = document[index].data['lokasi'];
                  String keterangan = document[index].data['keterangan'];
                  String docId = document[index].documentID;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('No : ' + (index + 1).toString()),
                                  Text('Nama Mesin : ' + nama),
                                  Text('Jenis Mesin : ' + jenis),
                                  Text('Kapasitas : ' + kapasitas),
                                  Text('Jumlah : ' + jumlah),
                                  Text('Lokasi : ' + lokasi),
                                  Text('Keterangan : ' + keterangan)
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  FlatButton(
                                      onPressed: () {
                                        showDeleteDialog(docId);
                                      },
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.delete_forever),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Text('Hapus')
                                        ],
                                      )),
                                  FlatButton(
                                      onPressed: () {
                                        mesin =
                                            Mesin.fromSnapshot(document[index]);
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) {
                                            return TambahMesin(mesin, 'edit');
                                          },
                                        ));
                                      },
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.edit),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Text('Edit')
                                        ],
                                      ))
                                ],
                              )
                            ],
                          )),
                    ),
                  );
                });
          }),
    );
  }

  deleteMesin(String docId) async {
    await Firestore.instance.collection('mesin').document(docId).delete();
  }

  Future<Null> showDeleteDialog(
    String docId,
  ) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Yakin akan menhapus mesin ini?'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    deleteMesin(docId);
                    Navigator.pop(context);
                  },
                  child: Text("Ya")),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Tidak'))
            ],
          );
        });
  }
}
