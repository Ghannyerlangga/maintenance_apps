import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:maintenance_apps/Screen/Dialog/amg_dialog.dart';

class Barcode extends StatefulWidget {
  @override
  _BarcodeState createState() => _BarcodeState();
}

class _BarcodeState extends State<Barcode> {
  String code = "";
  String getcode = "";
  final CollectionReference mesin = Firestore.instance.collection('mesin');

  Future scanbarcode() async {
    getcode = await FlutterBarcodeScanner.scanBarcode(
        "#87CEFA", "Cancel", true, ScanMode.QR);
    var data = await mesin.document(getcode).get();
    switch (data["jenis"]) {
      case "AMG":
        showDialog(
          context: context,
          builder: (BuildContext context) =>
              AMGDialog(value: data["jenis"], hasil: data["nama"]),
        );
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SCAN BARCODE",
          style: TextStyle(fontSize: 16.0),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        // alignment: Alignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: ClipOval(
              child: Material(
                shadowColor: Colors.black87,
                color: Colors.blue, // button color
                child: InkWell(
                  splashColor: Colors.white, // inkwell color
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: AutoSizeText(
                          "Scan QR-Code",
                          maxLines: 1,
                          maxFontSize: 20,
                          minFontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  onTap: () async {
                    scanbarcode();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
