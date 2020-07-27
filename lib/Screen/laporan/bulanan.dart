import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maintenance_apps/Screen/laporan/view.dart';
import 'package:maintenance_apps/Services/database.dart';
import 'package:pdf/pdf.dart';
import 'dart:io';
import 'package:pdf/widgets.dart';
import 'package:flutter/material.dart' as material;
import 'package:path_provider/path_provider.dart';

final DatabaseService database = DatabaseService();

List<DocumentSnapshot> dataList;

reportBulananView(context, DocumentSnapshot mesin, String namaUser) async {
  CollectionReference collectionReference =
      Firestore.instance.collection('checklist');

  final Document pdf = Document();
  QuerySnapshot data = await collectionReference
      .where('checklist', isEqualTo: 'Monthly')
      .where('jenis mesin', isEqualTo: mesin.data['nama'])
      .getDocuments();
  //harian = Harian.fromSnapshot(data);
  dataList = data.documents;
  List header = [
    'Clamp',
    'Coolant',
    'Dust',
    'Gas Hoses',
    'Rack',
    'Z-Axis',
    'Pengisi',
    'Waktu'
  ];

  String clamp;
  String coolant;
  String dust;
  String gasHoses;
  String rack;
  String z_axis;

  List<List<String>> listCheck = new List();

  for (var indice = 0; indice < dataList.length; indice++) {
    if (dataList[indice].data['clamp'] == true) {
      clamp = 'ya';
    } else {
      clamp = 'tidak';
    }

    if (dataList[indice].data['coolant'] == true) {
      coolant = 'ya';
    } else {
      coolant = 'tidak';
    }

    if (dataList[indice].data['dust'] == true) {
      dust = 'ya';
    } else {
      dust = 'tidak';
    }

    if (dataList[indice].data['gas hoses'] == true) {
      gasHoses = 'ya';
    } else {
      gasHoses = 'tidak';
    }

    if (dataList[indice].data['rack'] == true) {
      rack = 'ya';
    } else {
      rack = 'tidak';
    }

    if (dataList[indice].data['z-axis'] == true) {
      z_axis = 'ya';
    } else {
      z_axis = 'tidak';
    }

    List<String> recind = <String>[
      clamp,
      coolant,
      dust,
      gasHoses,
      rack,
      z_axis,
      dataList[indice].data['user'],
      dataList[indice].data['waktu'] + " " + dataList[indice].data['jam'],
    ];
    listCheck.add(recind);
  }

  pdf.addPage(MultiPage(
      pageFormat:
          PdfPageFormat.a4.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      crossAxisAlignment: CrossAxisAlignment.start,
      header: (Context context) {
        if (context.pageNumber == 1) {
          return null;
        }
        return Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            padding: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            decoration: const BoxDecoration(
                border:
                    BoxBorder(bottom: true, width: 0.5, color: PdfColors.grey)),
            child: Text('Report Harian',
                style: Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      footer: (Context context) {
        return Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
            child: Text('Page ${context.pageNumber} of ${context.pagesCount}',
                style: Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      build: (Context context) => <Widget>[
            Header(
                level: 0,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                          'Laporan Harian Perawatan Mesin ' +
                              mesin.data['nama'],
                          textScaleFactor: 2),
                      PdfLogo()
                    ])),
            Header(level: 1, text: 'Penanggun Jawab Mesin : ' + namaUser),
            Padding(padding: const EdgeInsets.all(10)),
            Table.fromTextArray(
                context: context, headers: header, data: listCheck),
          ]));
  //save PDF
  final String dir = (await getApplicationDocumentsDirectory()).path;
  final String path = '$dir/report-montly.pdf';
  final File file = File(path);
  print(path);
  await file.writeAsBytes(pdf.save());
  material.Navigator.of(context).pushReplacement(
    material.MaterialPageRoute(
      builder: (_) => PdfViewerPage(path),
    ),
  );
}
