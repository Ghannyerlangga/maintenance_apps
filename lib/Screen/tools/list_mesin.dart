import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/laporan/harian.dart';
import 'package:maintenance_apps/Screen/tools/tambah_mesin.dart';
import 'package:maintenance_apps/models/mesin.dart';

class ListMesin extends StatefulWidget {
  @override
  _ListMesinState createState() => _ListMesinState();
}

class _ListMesinState extends State<ListMesin> {

  Future<QuerySnapshot> data;
  List<DocumentSnapshot> document;
  


  @override
  void initState() {
    // TODO: implement initState

    data = database.getMesin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
              onTap: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder:(context){
                    return TambahMesin();
                  } ));
              },
              child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.add),
            ),
          )
        ],
        title: Text('List Mesin'),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: data,
        builder: (builder,snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          document = snapshot.data.documents;
          return ListView.builder(
            itemCount: document.length,
            itemBuilder: (contex,index){
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
                        Text('No : '+(index+1).toString()),
                        Text('Nama Mesin : '+nama),
                        Text('Jenis Mesin : '+jenis),
                        Text('Kapasitas : '+kapasitas),
                        Text('Jumlah : '+jumlah),
                        Text('Lokasi : '+lokasi),
                        Text('Keterangan : '+keterangan)
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