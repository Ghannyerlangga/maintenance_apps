import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:maintenance_apps/Services/document_getter.dart';

class Document1 extends StatefulWidget {
  final int documentNum;
  Document1({this.documentNum});
  @override
  _Document1State createState() => _Document1State();
}

class _Document1State extends State<Document1> {
  String localPath;
  String documentPath;
  String docTitle;

  @override
  void initState() {
    switch (widget.documentNum) {
      case 1:
        docTitle = "file procedure 1";
        documentPath =
            "https://firebasestorage.googleapis.com/v0/b/maintenance-acd46.appspot.com/o/Dokumen1.pdf?alt=media&token=0b1d537a-ac3a-46e1-afda-bcb305a03cb6";
        break;
      case 2:
        docTitle = "file procedure 2";
        documentPath =
            "https://firebasestorage.googleapis.com/v0/b/maintenance-acd46.appspot.com/o/Dokumen2.pdf?alt=media&token=c3d6a1e0-0cde-4bfe-8402-44238569a7ae";
        break;
      case 3:
        docTitle = "file procedure 3";
        documentPath =
            "https://firebasestorage.googleapis.com/v0/b/maintenance-acd46.appspot.com/o/Dokumen3.pdf?alt=media&token=bd3d14cb-448e-4b7f-9d66-6ffb489aedd6";
        break;
      default:
    }

    super.initState();

    DocumentGetter.loadPDF(documentPath).then((value) {
      setState(() {
        localPath = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(docTitle.toUpperCase()),
      ),
      body: localPath != null
          ? PDFView(filePath: localPath)
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
