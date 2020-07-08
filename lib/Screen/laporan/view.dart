import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';

class PdfViewerPage extends StatefulWidget {
  final String path;
  PdfViewerPage(this.path);
  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  bool _isLoading= false;
  
  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      appBar: AppBar(
        title : Text('Laporan'),
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed: ()=> null)
        ],
      ),
      path: widget.path,
    );
  }

}