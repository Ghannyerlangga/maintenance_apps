import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/Dialog/amg_dialog.dart';
import 'package:maintenance_apps/shared/loading.dart';

import '../change_data.dart';

class AmgList extends StatefulWidget {
  final String mesin;
  AmgList({this.mesin});
  @override
  _AmgListState createState() => _AmgListState();
}

class _AmgListState extends State<AmgList> {
  Future getData() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore
        .collection("mesin")
        .where("jenis", isEqualTo: widget.mesin)
        .getDocuments();
    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back, // add custom icons also
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Daftar Mesin',
          style: TextStyle(fontSize: 16.0),
        ),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UbahData(),
                    ));
              },
              icon: Icon(Icons.check),
              label: Text("Edit"))
        ],
      ),
      backgroundColor: Colors.blue[100],
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
                          title: Text(x.data["nama"]),
                          subtitle: Text("Jenis Mesin : ${x.data["jenis"]}"),
                          trailing: Text("${x.data["lokasi"]}"),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AMGDialog(
                                  value: x.data["jenis"],
                                  hasil: x.data["nama"]),
                            );
                          });
                    });
              }
            }),
      ),
    );
  }
}
