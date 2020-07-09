import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
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
  bool _isLoading= false;
  String  downloadFolderPath;
  DateTime time = DateTime.now();
  

  getDownload() async{
    final String ext = (await getExternalStorageDirectory()).parent.parent.parent.parent.parent.parent.parent.path;
    downloadFolderPath = ext+'sdcard/Download/report '+time.toString()+'.pdf';

    final File file = File(widget.path);
    await file.copy(downloadFolderPath).whenComplete(() {
      showSimpleDialog();
    });
  }
  
   Future<Null> showSimpleDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('File berhasil disimpan'),
          actions: <Widget>[
            FlatButton(
              onPressed: (){
                Navigator.pop(context);
              }, 
              child: Text("Ok"))
          ],
        );
      }
    );

  }

  download()async{
    await Permission.storage.request().then((value) {
      if(value.isGranted){
        getDownload();
      }
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title : Text('Laporan'),
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed: ()=> download())
        ],
      ),
      body: widget.path!=null? PDFView(filePath: widget.path):Loading()
    );
  }

}