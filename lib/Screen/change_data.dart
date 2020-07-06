import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/shared/loading.dart';

class UbahData extends StatefulWidget {
  @override
  _UbahDataState createState() => _UbahDataState();
}

class _UbahDataState extends State<UbahData> {
  Future getData() async {
    var firestore = Firestore.instance;
    DateTime _dueDate = DateTime.now();
    var _dateText = "${_dueDate.day}/${_dueDate.month}/${_dueDate.year}";
    QuerySnapshot qn = await firestore
        .collection("daily")
        .where("waktu", isEqualTo: _dateText)
        .getDocuments();
    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      body:Container(
        child: FutureBuilder(
      future: getData(),
      builder: (_, snapshot) {
        if (snapshot.connectionState ==ConnectionState.waiting) {
          return Center(
            child: Loading(),
          );
        } else {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (_, index) {
                final x = snapshot.data[index];
                return ListTile(
                  leading: Icon(Icons.assignment),
                  title: Text(x.data["jenis mesin"]),
                  subtitle: Text("Tanggal : ${x.data["waktu"]}"),
                  onTap: () {},
                );
              });
        }
      },
    ))));
  }
}
