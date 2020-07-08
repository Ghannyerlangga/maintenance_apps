import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maintenance_apps/Screen/Dialog/amg_dialog.dart';

class Barcode extends StatefulWidget {
  @override
  _BarcodeState createState() => _BarcodeState();
}

class _BarcodeState extends State<Barcode> {
  AMGDialog amg = AMGDialog();
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
    // setState(() {
    //   code = getcode;
    // });
  }

  Future getdialog() async {
    var data = await mesin.document(getcode).get();
    switch (data["jenis"]) {
      case "AMG":
        return AMGDialog();
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SCAN BARCODE"),
      ),
      backgroundColor: Colors.blue[100],
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
                onPressed: () async {
                  scanbarcode();
                  // getdialog();
                },
                child: Text("SCAN")),
          ],
        ),
      ),
    );
  }
}
