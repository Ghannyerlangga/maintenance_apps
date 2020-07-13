import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/tools/tambah_mesin.dart';
import 'package:maintenance_apps/models/mesin.dart';

class ListMesin extends StatefulWidget {
  @override
  _ListMesinState createState() => _ListMesinState();
}

class _ListMesinState extends State<ListMesin> {
  Stream<QuerySnapshot> data;
  List<DocumentSnapshot> document;
  DaftarMesin mesin;
  @override
  void initState() {
    data = getListMesin();
    super.initState();
  }

  Stream<QuerySnapshot> getListMesin() {
    return Firestore.instance.collection('mesin').snapshots();
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
                    return TambahMesin();
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
            mesin = DaftarMesin.fromJson(snapshot.data.documents);
            print(mesin.listMesin[0].nama);
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
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
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
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
