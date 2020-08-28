import 'package:flutter/material.dart';

class HeaderChecklist extends StatelessWidget {
  final String judul;
  const HeaderChecklist({Key key, this.judul}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double lebar = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(5, 15, 5, 5),
      padding: EdgeInsets.only(left: lebar * 0.05),
      child: Row(
        children: <Widget>[
          Container(
            width: lebar * 0.60,
            child: Text(judul),
          ),
          Container(
            alignment: Alignment.center,
            width: lebar * 0.15,
            child: Text("Ya"),
          ),
          Container(
            alignment: Alignment.center,
            width: lebar * 0.15,
            child: Text("Tidak"),
          ),
        ],
      ),
    );
  }
}
