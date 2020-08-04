import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  final String pesan;
  final String tipe;
  DialogWidget({this.tipe, this.pesan});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      title: Text(
        pesan,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              if (tipe == 'berhasil') {
                Navigator.pop(context);
              } else if (tipe == 'gagal') {
                Navigator.pop(context);
              }
            },
            child: Text("Ok"))
      ],
    );
  }
}
