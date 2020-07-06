import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/laporan/pilihan.dart';
import 'package:maintenance_apps/Services/database.dart';
import 'package:maintenance_apps/models/user.dart';

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

  Future<DocumentSnapshot> getUser(String id){
    return databaseService.getData(id);
  }

  Future<QuerySnapshot> getMesin(){
    return databaseService.getMesin();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: getUser(widget.id),
      builder: (builder ,snapshot) {
        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator());
        }

        if(snapshot.hasData){
          DocumentSnapshot listSnapshot = snapshot.data;
          user = User.fromSnapshot(listSnapshot);}
          String namaUser = user.nama;
          return Scaffold( 
              body: FutureBuilder<QuerySnapshot>(
              future: getMesin(),
              builder: (builder,snapshot) {
               if(!snapshot.hasData){
                 return Center(child: CircularProgressIndicator());
               }

               if (snapshot.hasData){
                document = snapshot.data.documents;
                 return ListView.builder(
                   itemCount: document.length,
                   itemBuilder: (context, index){
                     String nama = document[index].data['nama'];
                     return RaisedButton(onPressed: (){
                           Navigator.of(context).push(MaterialPageRoute(builder:(context){
                             return PilihanLaporan(document[index],namaUser);
                           } ));
                         },
                         child: Text(nama),);
                   }
                );
               
              }
              }
              ),
          );
        
      },);
  }
}