import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/laporan/harian.dart';
import 'package:maintenance_apps/Screen/tools/tambah_rapair.dart';
import 'package:maintenance_apps/models/mesin.dart';
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

  List<Mesin> dataListMesin;

  DaftarMesin daftarMesin;

  @override
  void initState() {
    dataRepair = getRepair();
    //listMesin = getMesinData();
    //mesin = DaftarMesin.fromJson(listMesin);
    getMesinData();

    //print(dataListMesin[0].nama);

    // TODO: implement initState
    super.initState();
  }

  getMesinData() async {
    dataMesin = await Firestore.instance
        .collection('mesin')
        .where('jenis', isEqualTo: widget.jenisMesin)
        .getDocuments();
    listMesin = dataMesin.documents;
    daftarMesin = DaftarMesin.fromJson(listMesin);
  }

  Stream<QuerySnapshot> getRepair() {
    return repairCollection
        .orderBy("time", descending: false)
        .where('jenis mesin', isEqualTo: widget.jenisMesin)
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
                    return TambahRepair(daftarMesin);
                  }));
                }),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: dataRepair,
          builder: (builder, snapshot) {
            if (!snapshot.hasData && (daftarMesin.listMesin.length) < 1) {
              return Loading();
            }
            dataList = snapshot.data.documents;

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
          }),
    );
  }
}
