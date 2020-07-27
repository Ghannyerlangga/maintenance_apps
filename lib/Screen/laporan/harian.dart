import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maintenance_apps/Screen/laporan/view.dart';
import 'package:maintenance_apps/Services/database.dart';
import 'package:maintenance_apps/shared/loading.dart';
import 'package:pdf/pdf.dart';
import 'dart:io';
import 'package:pdf/widgets.dart';
import 'package:flutter/material.dart' as material;
import 'package:path_provider/path_provider.dart';

final DatabaseService database = DatabaseService();

List<DocumentSnapshot> dataList;

reportHarianView(context, DocumentSnapshot mesin, String namaUser) async {
  CollectionReference collectionReference =
      Firestore.instance.collection('checklist');

  String cableChain;
  String elpiji;
  String limitSwitch;
  String linearGuide;
  String machine;
  String nitrogen;
  String nozzle;
  String oxygen;
  String rail;

  final Document pdf = Document();
  QuerySnapshot data = await collectionReference
      .where('checklist', isEqualTo: 'Daily')
      .where('jenis mesin', isEqualTo: mesin.data['nama'])
      .getDocuments();
  //harian = Harian.fromSnapshot(data);
  dataList = data.documents;

  List<List<String>> listCheck = new List();

  for (var indice = 0; indice < dataList.length; indice++) {
    if (dataList[indice].data['cable chain'] == true) {
      cableChain = 'ya';
    } else {
      cableChain = 'tidak';
    }

    if (dataList[indice].data['elpiji'] == true) {
      elpiji = 'ya';
    } else {
      elpiji = 'tidak';
    }

    if (dataList[indice].data['limit switch'] == true) {
      limitSwitch = 'ya';
    } else {
      limitSwitch = 'tidak';
    }

    if (dataList[indice].data['linear guide'] == true) {
      linearGuide = 'ya';
    } else {
      linearGuide = 'tidak';
    }

    if (dataList[indice].data['machine'] == true) {
      machine = 'ya';
    } else {
      machine = 'tidak';
    }

    if (dataList[indice].data['nitrogen'] == true) {
      nitrogen = 'ya';
    } else {
      nitrogen = 'tidak';
    }

    if (dataList[indice].data['nozzle'] == true) {
      nozzle = 'ya';
    } else {
      nozzle = 'tidak';
    }

    if (dataList[indice].data['oxygen'] == true) {
      oxygen = 'ya';
    } else {
      oxygen = 'tidak';
    }

    if (dataList[indice].data['rail'] == true) {
      rail = 'ya';
    } else {
      rail = 'tidak';
    }
    List<String> recind = <String>[
      cableChain,
      elpiji,
      limitSwitch,
      linearGuide,
      machine,
      nitrogen,
      nozzle,
      oxygen,
      rail,
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
                context: context,
                headers: [
                  'cable chain',
                  'elpiji',
                  'limit switch',
                  'linear guide',
                  'machine',
                  'nitrogen',
                  'nozzle',
                  'oxygen',
                  'rail',
                  'pengisi',
                  'waktu',
                ],
                data: listCheck),
          ]));
  //save PDF
  final String ext = (await getExternalStorageDirectory())
      .parent
      .parent
      .parent
      .parent
      .parent
      .parent
      .parent
      .path;
  print(ext);
  final String dir = (await getApplicationDocumentsDirectory()).path;
  final String path = '$dir/report.pdf';
  final File file = File(path);
  print(path);
  await file.writeAsBytes(pdf.save()).then((value) {
    material.Navigator.pushReplacement(
      context,
      material.MaterialPageRoute(
        builder: (_) =>
            data.documents.isEmpty ? Loading() : PdfViewerPage(path),
      ),
    );
  });
}
