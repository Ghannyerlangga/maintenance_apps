import 'dart:io';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class PdfViewerPage extends StatefulWidget {
  final String path;
  PdfViewerPage(this.path);
  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  String downloadFolderPath;
  DateTime time = DateTime.now();

  ProgressDialog pr;

  getDownload() async {
    final String ext = (await getExternalStorageDirectory())
        .parent
        .parent
        .parent
        .parent
        .parent
        .parent
        .parent
        .path;
    downloadFolderPath =
        ext + 'sdcard/Download/report ' + time.toString() + '.pdf';
    downloadFolderPath = ext +
        'sdcard/Download/report ' +
        time.day.toString() +
        '-' +
        time.month.toString() +
        '-' +
        time.year.toString() +
        '.pdf';

    final File file = File(widget.path);
    await file.copy(downloadFolderPath).then((value) {
      print(value.path);
      // showSimpleDialog(value.path);
      pr.hide().whenComplete(() => showSimpleDialog(value.path));
    }).catchError((e) {
      print(e);
    });
  }

  Future<Null> showSimpleDialog(
    String pesan,
  ) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('File berhasil disimpan ' + pesan),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Ok"))
            ],
          );
        });
  }

  download() async {
    await Permission.storage.request().then((value) {
      if (value.isGranted) {
        getDownload();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context);
    pr.style(message: 'Sedang menyimpan file...');

    return Scaffold(
        appBar: AppBar(
          title: Text('Laporan'),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  pr.show();
                  Future.delayed(Duration(seconds: 3)).then((value) {
                    download();
                  });
                })
          ],
        ),
        body: PDFView(filePath: widget.path));
  }
}
