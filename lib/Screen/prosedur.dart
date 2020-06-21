import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class Prosedur extends StatefulWidget {
  @override
  _ProsedurState createState() => _ProsedurState();
}

class _ProsedurState extends State<Prosedur> {
  bool _isLoading = false, _isInit = true;
  PDFDocument document;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
        children: <Widget>[
          Expanded(
            child: _isInit
                ? Center(
                  child: RaisedButton(
                        color: Colors.lightBlueAccent,
                        child: Text("Document 1",
                            style: TextStyle(
                                color: Colors.white38.withOpacity(0.8))),
                        onPressed: (){
                          loadFromURL();
                          }
                        ),
                )
                : _isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : PDFViewer(document: document),
          )
        ],
      )),
    );
  }

loadFromURL() async {
  setState(() {
    _isInit = false;
    _isLoading = true;
  });
  document = await PDFDocument.fromURL("http://www.pdf995.com/samples/pdf.pdf");
  setState(() {
    _isLoading = false;
  });
}
}
