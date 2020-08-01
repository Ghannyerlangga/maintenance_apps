import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:maintenance_apps/Screen/tools/tambah_mesin.dart';
import 'package:maintenance_apps/models/mesin.dart';

class ListMesin extends StatefulWidget {
  final String jenisMesin;
  ListMesin(this.jenisMesin);

  @override
  _ListMesinState createState() => _ListMesinState();
}

class _ListMesinState extends State<ListMesin> {
  Stream<QuerySnapshot> data;
  List<DocumentSnapshot> document;

  Mesin mesin;

  @override
  void initState() {
    data = getListMesin(widget.jenisMesin);
    super.initState();
  }

  Stream<QuerySnapshot> getListMesin(String jenisMesin) {
    return Firestore.instance
        .collection('mesin')
        .where('jenis', isEqualTo: jenisMesin)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return TambahMesin(mesin, 'tambah');
                  }));
                }),
          )
        ],
        title: Text('List Mesin'),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: data,
          builder: (builder, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            document = snapshot.data.documents;
            return _tableMesin(document);
          }),
    );
  }

  deleteMesin(String docId) async {
    await Firestore.instance.collection('mesin').document(docId).delete();
  }

  Future<Null> showDeleteDialog(
    String docId,
  ) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Yakin akan menhapus mesin ini?'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    deleteMesin(docId);
                    Navigator.pop(context);
                  },
                  child: Text("Ya")),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Tidak'))
            ],
          );
        });
  }

  Widget _tableMesin(List<DocumentSnapshot> documents) {
    return Container(
      child: HorizontalDataTable(
        leftHandSideColumnWidth: 30,
        rightHandSideColumnWidth: 830,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(color: Colors.black54, width: 1.0),
                    bottom: BorderSide(color: Colors.black54, width: 1.0))),
            child: Text((index + 1).toString()),
            width: 30,
            height: 50,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            alignment: Alignment.center,
          );
        },
        rightSideItemBuilder: (context, index) {
          return Row(
            children: <Widget>[
              _tabelCell(document[index]['nama']),
              _tabelCell(document[index]['jenis']),
              _tabelCell(document[index]['kapasitas']),
              _tabelCell(document[index]['jumlah']),
              _tabelCell(document[index]['lokasi']),
              _tabelCell(document[index]['keterangan']),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.black54, width: 1.0),
                        bottom: BorderSide(color: Colors.black54, width: 1.0))),
                width: 200,
                height: 50,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    FlatButton.icon(
                        onPressed: () {
                          showDeleteDialog(documents[index].documentID);
                        },
                        icon: Icon(Icons.delete_forever),
                        label: Text('Hapus')),
                    FlatButton.icon(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              mesin = Mesin.fromSnapshot(documents[index]);
                              return TambahMesin(mesin, 'ubah');
                            },
                          ));
                        },
                        icon: Icon(Icons.edit),
                        label: Text('Ubah'))
                  ],
                ),
              )
            ],
          );
        },
        itemCount: documents.length,
        // rowSeparatorWidget: const Divider(
        //   color: Colors.black54,
        //   height: 0.0,
        //   thickness: 0.0,
        // ),
        leftHandSideColBackgroundColor: Colors.blue[200],
        rightHandSideColBackgroundColor: Colors.blue[100],
      ),
      height: MediaQuery.of(context).size.height,
    );
  }

  Widget _tabelCell(String label) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              right: BorderSide(color: Colors.black54, width: 1.0),
              bottom: BorderSide(color: Colors.black54, width: 1.0))),
      child: Text(label),
      width: 100,
      height: 50,
      //padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      alignment: Alignment.center,
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('No', 30.0),
      _getTitleItemWidget('Nama Mesin', 100.0),
      _getTitleItemWidget('Jenis Mesin', 100.0),
      _getTitleItemWidget('Kapasitas', 100.0),
      _getTitleItemWidget('Jumlah', 100.0),
      _getTitleItemWidget('Lokasi', 100.0),
      _getTitleItemWidget('Keterangan', 100.0),
      _getTitleItemWidget('Aksi', 200.0)
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue[200],
          border: Border(
              right: BorderSide(color: Colors.black54, width: 1.0),
              bottom: BorderSide(color: Colors.black54, width: 1.0))),
      child: Text(
        label,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      width: width,
      height: 50,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 5),
      alignment: Alignment.center,
    );
  }
}
