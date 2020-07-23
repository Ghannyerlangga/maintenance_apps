import 'dart:io';
<<<<<<< HEAD
import 'package:progress_dialog/progress_dialog.dart';
=======
>>>>>>> f8e560173d0b0054a6e7950168e75ef4c3edfd9c
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:maintenance_apps/shared/loading.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class PdfViewerPage extends StatefulWidget {
  final String path;
  PdfViewerPage(this.path);
  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
<<<<<<< HEAD
  bool _isLoading = true;
  String downloadFolderPath;
  DateTime time = DateTime.now();

  ProgressDialog pr;

=======
  // bool _isLoading = false;
  String downloadFolderPath;
  DateTime time = DateTime.now();

>>>>>>> f8e560173d0b0054a6e7950168e75ef4c3edfd9c
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
<<<<<<< HEAD
    downloadFolderPath =
        ext + 'sdcard/Download/report ' + time.toString() + '.pdf';
=======
    downloadFolderPath = ext +
        'sdcard/Download/report ' +
        time.day.toString() +
        '-' +
        time.month.toString() +
        '-' +
        time.year.toString() +
        '.pdf';
>>>>>>> f8e560173d0b0054a6e7950168e75ef4c3edfd9c

    final File file = File(widget.path);
    await file.copy(downloadFolderPath).then((value) {
      print(value.path);
      // showSimpleDialog(value.path);
      pr.hide().whenComplete(() => showSimpleDialog(value.path));
    }).catchError((e) {
      print(e);
    });
  }

<<<<<<< HEAD
  Future<Null> showSimpleDialog(
    String pesan,
  ) async {
=======
  Future<Null> showSimpleDialog() async {
>>>>>>> f8e560173d0b0054a6e7950168e75ef4c3edfd9c
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
<<<<<<< HEAD
            title: Text('File berhasil disimpan ' + pesan),
=======
            title: Text('File berhasil disimpan'),
>>>>>>> f8e560173d0b0054a6e7950168e75ef4c3edfd9c
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
<<<<<<< HEAD
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
=======
            IconButton(icon: Icon(Icons.save), onPressed: () => download())
          ],
        ),
        body: widget.path != null ? PDFView(filePath: widget.path) : Loading());
>>>>>>> f8e560173d0b0054a6e7950168e75ef4c3edfd9c
  }
}
