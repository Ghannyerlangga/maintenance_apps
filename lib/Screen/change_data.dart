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
        .collection("checklist")
        .where("waktu", isEqualTo: _dateText)
        .getDocuments();
    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.blue[100],
            appBar: AppBar(
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back, // add custom icons also
                ),
              ),
              title: Text(
                "Daftar Checklist Hari Ini",
                style: TextStyle(fontSize: 16.0),
              ),
              centerTitle: true,
            ),
            body: Container(
                child: FutureBuilder(
              future: getData(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
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
                          subtitle:
                              Text("Tipe Checklist : ${x.data["checklist"]}"),
                          trailing: Text(x.data["user"]),
                          onTap: () {},
                        );
                      });
                }
              },
            ))));
  }
}
