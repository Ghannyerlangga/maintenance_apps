import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/laporan/bulanan.dart';
import 'package:maintenance_apps/Screen/laporan/harian.dart';
import 'package:maintenance_apps/Screen/laporan/plasma-harian.dart';
import 'package:maintenance_apps/Screen/laporan/tahunan.dart';

class PilihanLaporan extends StatelessWidget {
  final DocumentSnapshot mesin;
  final String namaUser;
  PilihanLaporan(this.mesin, this.namaUser);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: <Widget>[
                  button('Harian', context),
                  button('Bulanan', context),
                  button('Tahunan', context),
                  button('Plasma', context)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget button(String text, BuildContext context) {
    return RaisedButton(
      child: Text(text),
      onPressed: () {
        if (text == 'Harian') {
          reportHarianView(context, mesin, namaUser);
        } else if (text == 'Bulanan') {
          reportBulananView(context, mesin, namaUser);
        } else if (text == 'Tahunan') {
          reportTahunanView(context, mesin, namaUser);
        } else if (text == 'Plasma') {
          reportPlasmaHarianView(context, mesin, namaUser);
        }
      },
    );
  }
}
