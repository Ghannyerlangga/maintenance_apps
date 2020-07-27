import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:maintenance_apps/Screen/tools/tambah_consumable.dart';
import 'package:maintenance_apps/models/consumable.dart';
import 'package:maintenance_apps/shared/loading.dart';

class ListConsumable extends StatefulWidget {
  final String jenisMesin;
  ListConsumable(this.jenisMesin);
  @override
  _ListConsumableState createState() => _ListConsumableState();
}

class _ListConsumableState extends State<ListConsumable> {
  final CollectionReference consumableCollection =
      Firestore.instance.collection('consumable');

  Stream<QuerySnapshot> dataConsumable;
  List<DocumentSnapshot> dataList;
  QuerySnapshot dataMesin;
  List<DocumentSnapshot> listMesin;

  Consumable consumable;

  @override
  void initState() {
    dataConsumable = getConsumable();

    super.initState();
  }

  Stream<QuerySnapshot> getConsumable() {
    return consumableCollection
        .where('jenis', isEqualTo: widget.jenisMesin)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Perbaikan Mesin'),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return TambahConsumable(consumable, 'tambah');
                  }));
                }),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: dataConsumable,
          builder: (builder, snapshot) {
            if (!snapshot.hasData) {
              return Loading();
            }
            dataList = snapshot.data.documents;

            return _tableRepair(dataList);
          }),
    );
  }

  deleteRepair(String docId) async {
    await Firestore.instance.collection('consumable').document(docId).delete();
  }

  Future<Null> showDeleteDialog(
    String docId,
  ) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Yakin akan menhapus data ini?'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    deleteRepair(docId);
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

  Widget _tableRepair(List<DocumentSnapshot> documents) {
    return Container(
      child: HorizontalDataTable(
        leftHandSideColumnWidth: 30,
        rightHandSideColumnWidth: 730,
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
              _tabelCell(documents[index]['nama'].toString()),
              _tabelCell(documents[index]['jenis'].toString()),
              _tabelCell(documents[index]['part'].toString()),
              _tabelCell(documents[index]['jumlah'].toString()),
              _tabelCell(documents[index]['keterangan'].toString()),
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
                          DocumentSnapshot snap = documents[index];
                          snap.data.addAll({'id': snap.documentID});
                          print(snap.data);
                          consumable = Consumable.fromSnapshot(snap);
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return TambahConsumable(consumable, 'ubah');
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
      _getTitleItemWidget('Nama Consumable', 100.0),
      _getTitleItemWidget('Jenis', 100.0),
      _getTitleItemWidget('Part Mesin', 100.0),
      _getTitleItemWidget('Jumlah', 100.0),
      _getTitleItemWidget('Keterangan', 100.0),
      _getTitleItemWidget('Aksi', 200.0),
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
