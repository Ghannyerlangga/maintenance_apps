import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

import 'Document/document1.dart';

class Prosedur extends StatefulWidget {
  @override
  _ProsedurState createState() => _ProsedurState();
}

class _ProsedurState extends State<Prosedur> {
  // bool _isLoading = false, _isInit = true;
  PDFDocument document;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
        children: <Widget>[
          Expanded(
            child:Center(
                  child: RaisedButton(
                        color: Colors.lightBlueAccent,
                        child: Text("Document 1",
                            style: TextStyle(
                                color: Colors.white38.withOpacity(0.8))),
                        onPressed: (){
                          Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Document1(documentNum: 1,);
                            }));
                          }
                        ),
                )
          ),
          Expanded(
            child: Center(
                  child: RaisedButton(
                        color: Colors.lightBlueAccent,
                        child: Text("Document 2",
                            style: TextStyle(
                                color: Colors.white38.withOpacity(0.8))),
                        onPressed: (){
                          Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Document1(documentNum: 2,);
                            }));
                          }
                        ),
                )
                
          )
        ],
      )),
    );
  }
}
