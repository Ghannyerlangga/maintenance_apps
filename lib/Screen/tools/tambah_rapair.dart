import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/models/mesin.dart';

class TambahRepair extends StatefulWidget {
  final DaftarMesin mesin;
  TambahRepair(this.mesin);
  @override
  _TambahRepairState createState() => _TambahRepairState();
}

class _TambahRepairState extends State<TambahRepair> {
  TextEditingController _tanggalRusak = TextEditingController();
  TextEditingController _tanggalPerbaikan = TextEditingController();
  TextEditingController _consumableController = TextEditingController();
  TextEditingController _keteranganController = TextEditingController();
  DateTime waktu = DateTime.now();

  DateTime tanggalRusak = DateTime.now();
  DateTime tanggalPerbaikan = DateTime.now();

  String namaMesin;

  CollectionReference collection = Firestore.instance.collection('repair');

  tambahRepair(String nama, String tanggalRusak, String tanggalPerbaikan,
      String consumable, String keterangan) async {
    await collection.add({
      'nama': nama,
      'tanggal rusak': tanggalRusak,
      'tanggal perbaikan': tanggalPerbaikan,
      'consumable': consumable,
      'keterangan': keterangan,
      'time': waktu
    }).whenComplete(() {
      namaMesin = null;
      _tanggalPerbaikan.clear();
      _tanggalRusak.clear();
      _consumableController.clear();
      _keteranganController.clear();
    });
  }

  Future<Null> _pilihTanggal(BuildContext context, String jenisTanggal) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: tanggalRusak,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != tanggalRusak)
      setState(() {
        if (jenisTanggal == 'rusak') {
          tanggalRusak = picked;
          _tanggalRusak.text = tanggalRusak.toString().split(' ')[0];
        } else if (jenisTanggal == 'perbaikan') {
          tanggalPerbaikan = picked;
          _tanggalPerbaikan.text = tanggalPerbaikan.toString().split(' ')[0];
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah data perbaikan mesin"),
      ),
      body: ListView(
        children: [
          DropdownButton(
            hint: Text("Pilih Nama Mesin"),
            value: namaMesin,
            items: widget.mesin.listMesin.map((item) {
              return DropdownMenuItem(child: Text(item.nama), value: item.nama);
            }).toList(),
            onChanged: (value) {
              setState(() {
                namaMesin = value;
              });
            },
          ),
          TextField(
            controller: _tanggalRusak,
            decoration: InputDecoration(
              hintText: "tanggal kerusakan mesin",
            ),
            onTap: () {
              _pilihTanggal(context, 'rusak');
            },
          ),
          TextField(
            controller: _tanggalPerbaikan,
            decoration: InputDecoration(
              hintText: "tanggal perbaikan mesin",
            ),
            onTap: () {
              _pilihTanggal(context, 'perbaikan');
            },
          ),
          inputField('consumable', _consumableController, 'consumable'),
          inputField('keterangan', _keteranganController, 'keterangan'),
          RaisedButton(
              child: Text('Simpan'),
              onPressed: () {
                tambahRepair(
                    namaMesin,
                    _tanggalRusak.text,
                    _tanggalPerbaikan.text,
                    _consumableController.text,
                    _keteranganController.text);
              })
        ],
      ),
    );
  }

  Widget inputField(
      String leading, TextEditingController controller, String hint) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: hint),
      ),
    );
  }
}
