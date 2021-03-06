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

reportPlasmaHarianView(context, DocumentSnapshot mesin, String namaUser) async {
  CollectionReference collectionReference =
      Firestore.instance.collection('checklist');

  final Document pdf = Document();
  QuerySnapshot data = await collectionReference
      .where('checklist', isEqualTo: 'Daily-Plasma')
      .where('jenis mesin', isEqualTo: mesin.data['nama'])
      .getDocuments();
  //harian = Harian.fromSnapshot(data);
  dataList = data.documents;
  List header = [
    'Filter Udara',
    'Level Coolant',
    'Tekanan Angin',
    'Tekanan Angin Cutflow',
    'Pengisi',
    'Waktu'
  ];

  List<List<String>> listCheck = new List();

  String filterUdara;
  String levelCoolant;
  String tekananAngin;
  String tekananAngingCutflow;

  for (var indice = 0; indice < dataList.length; indice++) {
    if (dataList[indice].data['filter udara'] == true) {
      filterUdara = 'ya';
    } else {
      filterUdara = 'tidak';
    }

    if (dataList[indice].data['level coolant'] == true) {
      levelCoolant = 'ya';
    } else {
      levelCoolant = 'tidak';
    }

    if (dataList[indice].data['tekanan angin'] == true) {
      tekananAngin = 'ya';
    } else {
      tekananAngin = 'tidak';
    }

    if (dataList[indice].data['tekanan angin cutflow'] == true) {
      tekananAngingCutflow = 'ya';
    } else {
      tekananAngingCutflow = 'tidak';
    }

    List<String> recind = <String>[
      filterUdara,
      levelCoolant,
      tekananAngin,
      tekananAngingCutflow,
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
  final String path = '$dir/report-daily-plasma.pdf';
  final File file = File(path);
  print(path);
  await file.writeAsBytes(pdf.save());
  material.Navigator.of(context).pushReplacement(
    material.MaterialPageRoute(
      builder: (_) => PdfViewerPage(path),
    ),
  );
}
