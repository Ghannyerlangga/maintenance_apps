import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
class Barcode extends StatefulWidget {
  @override
  _BarcodeState createState() => _BarcodeState();
}

class _BarcodeState extends State<Barcode> {
  String code="";
  String getcode="";

  Future scanbarcode() async{
    getcode = await FlutterBarcodeScanner.scanBarcode("#87CEFA", "Cancel", true, ScanMode.QR);
    setState(() {
      code = getcode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SCAN BARCODE"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[FlatButton(onPressed: () {
            scanbarcode();
          }, child: Text("SCAN")),
          Text(code)
          ],
        ),
      ),
    );
  }
}
