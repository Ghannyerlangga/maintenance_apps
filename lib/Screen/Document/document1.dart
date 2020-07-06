import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:maintenance_apps/Services/document_getter.dart';

class Document1 extends StatefulWidget {
  int document_num;
  Document1({this.document_num});
  @override
  _Document1State createState() => _Document1State();
}

class _Document1State extends State<Document1> {
  String localPath;
  String document_path;

  @override
  void initState() {
    if(widget.document_num==1){
      document_path = "https://firebasestorage.googleapis.com/v0/b/maintenance-acd46.appspot.com/o/Handout%20Farhan%20Reza%20Saputra.pdf?alt=media&token=6a2a3cd9-13f3-4eaf-9feb-c394ac1d9c22";
    }else{
      document_path = "https://firebasestorage.googleapis.com/v0/b/maintenance-acd46.appspot.com/o/ELS%2015%20Februari%202020.pdf?alt=media&token=42af316d-165c-48f4-a79d-ad77d7481a44";
    }
    // TODO: implement initState

    super.initState();

    DocumentGetter.loadPDF(document_path).then((value) {
      setState(() {
        localPath = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: localPath != null
          ? PDFView(filePath: localPath)
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
