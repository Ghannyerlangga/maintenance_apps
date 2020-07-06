import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/laporan/harian.dart';

class PilihanLaporan extends StatelessWidget {
  final DocumentSnapshot mesin;
  final String namaUser;
  PilihanLaporan(this.mesin,this.namaUser);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          button('Harian',context),
          button('Mingguan',context),
          button('bulanan',context),
        ],
      ),
    );
  }

  Widget button(String text,BuildContext context){
    return RaisedButton(
      child: Text(text),
      onPressed: (){
        reportHarianView(context, mesin, namaUser);
      },
    );
  }
}