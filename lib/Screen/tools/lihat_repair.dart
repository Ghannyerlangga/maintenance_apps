import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:maintenance_apps/Screen/laporan/harian.dart';
import 'package:maintenance_apps/Screen/tools/tambah_rapair.dart';
import 'package:maintenance_apps/models/mesin.dart';
import 'package:maintenance_apps/models/repair.dart';
import 'package:maintenance_apps/shared/loading.dart';

class ShowRepair extends StatefulWidget {
  final String jenisMesin;
  ShowRepair(this.jenisMesin);
  @override
  _ShowRepairState createState() => _ShowRepairState();
}

class _ShowRepairState extends State<ShowRepair> {
  final CollectionReference repairCollection =
      Firestore.instance.collection('repair');

  Stream<QuerySnapshot> dataRepair;
  List<DocumentSnapshot> dataList;
  QuerySnapshot dataMesin;
  List<DocumentSnapshot> listMesin;

  Repair repair;
  List<Mesin> dataListMesin;

<<<<<<< HEAD
  DaftarMesin daftarMesin;
=======
  DaftarMesin mesin;
>>>>>>> f8e560173d0b0054a6e7950168e75ef4c3edfd9c

  @override
  void initState() {
    dataRepair = getRepair();
    //listMesin = getMesinData();
    //mesin = DaftarMesin.fromJson(listMesin);
    getMesinData();
    //print(dataListMesin[0].nama);
<<<<<<< HEAD

    // TODO: implement initState
=======
>>>>>>> f8e560173d0b0054a6e7950168e75ef4c3edfd9c
    super.initState();
  }

  getMesinData() async {
<<<<<<< HEAD
    dataMesin = await Firestore.instance
        .collection('mesin')
        .where('jenis', isEqualTo: widget.jenisMesin)
        .getDocuments();
=======
    dataMesin = await database.getMesin();
>>>>>>> f8e560173d0b0054a6e7950168e75ef4c3edfd9c
    listMesin = dataMesin.documents;
    daftarMesin = DaftarMesin.fromJson(listMesin);
  }

  Stream<QuerySnapshot> getRepair() {
<<<<<<< HEAD
    return repairCollection
        .orderBy("time", descending: false)
        .where('jenis mesin', isEqualTo: widget.jenisMesin)
        .snapshots();
=======
    return repairCollection.orderBy("time", descending: false).snapshots();
>>>>>>> f8e560173d0b0054a6e7950168e75ef4c3edfd9c
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
<<<<<<< HEAD
                    return TambahRepair(daftarMesin, 'tambah', repair);
=======
                    return TambahRepair(mesin);
>>>>>>> f8e560173d0b0054a6e7950168e75ef4c3edfd9c
                  }));
                }),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: dataRepair,
          builder: (builder, snapshot) {
            if (!snapshot.hasData) {
              return Loading();
            }
            dataList = snapshot.data.documents;

<<<<<<< HEAD
            return _tableRepair(dataList);
=======
            return ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('No : ' + (index + 1).toString()),
                          Text('Nama Mesin : ' + dataList[index].data['nama']),
                          Text('Tanggal Kerusakan Mesin : ' +
                              dataList[index].data['tanggal rusak']),
                          Text('Tanggal Perbaikan Mesin : ' +
                              dataList[index].data['tanggal perbaikan']),
                          Text('Consumable : ' +
                              dataList[index].data['consumable']),
                          Text('Keterangan : ' +
                              dataList[index].data['keterangan']),
                        ],
                      ),
                    ),
                  );
                });
>>>>>>> f8e560173d0b0054a6e7950168e75ef4c3edfd9c
          }),
    );
  }

  deleteRepair(String docId) async {
    await Firestore.instance.collection('repair').document(docId).delete();
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
        rightHandSideColumnWidth: 930,
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
              _tabelCell(documents[index]['tanggal rusak'].toString()),
              _tabelCell(documents[index]['tanggal perbaikan'].toString()),
              _tabelCell(documents[index]['spare part'].toString()),
              _tabelCell(documents[index]['consumable'].toString()),
              _tabelCell(documents[index]['pj'].toString()),
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
                          repair = Repair.fromSnapshot(documents[index]);
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return TambahRepair(daftarMesin, 'ubah', repair);
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
      _getTitleItemWidget('Tanggal Kerusakan Mesin', 100.0),
      _getTitleItemWidget('Tanggal Perbaikan Mesin', 100.0),
      _getTitleItemWidget('Spare Part', 100.0),
      _getTitleItemWidget('Consumable', 100.0),
      _getTitleItemWidget('Penanggung Jawab', 100.0),
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
      ),
      width: width,
      height: 50,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 5),
      alignment: Alignment.center,
    );
  }
}
