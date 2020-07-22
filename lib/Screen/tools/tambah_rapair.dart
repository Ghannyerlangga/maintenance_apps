import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/models/mesin.dart';
import 'package:maintenance_apps/models/repair.dart';
import 'package:maintenance_apps/shared/loading.dart';

class TambahRepair extends StatefulWidget {
  final Repair repair;
  final DaftarMesin mesin;
  final String mode;
  TambahRepair(this.mesin, this.mode, this.repair);
  @override
  _TambahRepairState createState() => _TambahRepairState();
}

class _TambahRepairState extends State<TambahRepair> {
  bool _modeTambah = true;
  TextEditingController _tanggalRusak = TextEditingController();
  TextEditingController _tanggalPerbaikan = TextEditingController();
  TextEditingController _consumableController = TextEditingController();
  TextEditingController _keteranganController = TextEditingController();
  TextEditingController _pjController = TextEditingController();
  TextEditingController _sparePartController = TextEditingController();
  DateTime waktu = DateTime.now();

  DateTime tanggalRusak = DateTime.now();
  DateTime tanggalPerbaikan = DateTime.now();

  String namaMesin;

  CollectionReference collection = Firestore.instance.collection('repair');

  @override
  void initState() {
    if (widget.mode != 'tambah') {
      _modeTambah = false;
      namaMesin = widget.repair.nama;
      _tanggalRusak.text = widget.repair.tanggalRusak;
      _tanggalPerbaikan.text = widget.repair.tanggalPerbaikan;
      _consumableController.text = widget.repair.consumable;
      _keteranganController.text = widget.repair.keterangan;
      _pjController.text = widget.repair.pj;
      _sparePartController.text = widget.repair.sparePart;
    }
    super.initState();
  }

  tambahRepair(
      String nama,
      String tanggalRusak,
      String tanggalPerbaikan,
      String consumable,
      String penanggungJawab,
      String sparePart,
      String keterangan) async {
    await collection.add({
      'jenis mesin': widget.mesin.listMesin[0].jenis,
      'pj': penanggungJawab,
      'spare part': sparePart,
      'nama': nama,
      'tanggal rusak': tanggalRusak,
      'tanggal perbaikan': tanggalPerbaikan,
      'consumable': consumable,
      'keterangan': keterangan,
      'time': waktu
    }).then((value) {
      value.updateData({'id': value.documentID});
      namaMesin = null;
      _tanggalPerbaikan.clear();
      _tanggalRusak.clear();
      _consumableController.clear();
      _keteranganController.clear();
    });
  }

  ubahRepair(
      String nama,
      String tanggalRusak,
      String tanggalPerbaikan,
      String consumable,
      String penanggungJawab,
      String sparePart,
      String keterangan) async {
    await collection.document(widget.repair.id).setData({
      'id': widget.repair.id,
      'jenis mesin': widget.mesin.listMesin[0].jenis,
      'pj': penanggungJawab,
      'spare part': sparePart,
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
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      width: MediaQuery.of(context).size.width * 0.20,
                      child: Text(
                        "Tanggal Kerusakan Mesin",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: DropdownButton(
                      hint: Text("Pilih Nama Mesin"),
                      value: namaMesin,
                      items: widget.mesin.listMesin.map((item) {
                        return DropdownMenuItem(
                            child: Text(item.nama), value: item.nama);
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          namaMesin = value;
                        });
                      },
                    ),
                  ),
                ],
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      width: MediaQuery.of(context).size.width * 0.20,
                      child: Text(
                        "Tanggal Kerusakan Mesin",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: TextField(
                      controller: _tanggalRusak,
                      decoration: InputDecoration(
                        hintText: "tanggal kerusakan mesin",
                      ),
                      onTap: () {
                        _pilihTanggal(context, 'rusak');
                      },
                    ),
                  ),
                ],
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      width: MediaQuery.of(context).size.width * 0.20,
                      child: Text(
                        "Tanggal Perbaikan Mesin",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: TextField(
                      controller: _tanggalPerbaikan,
                      decoration: InputDecoration(
                        hintText: "tanggal perbaikan mesin",
                      ),
                      onTap: () {
                        _pilihTanggal(context, 'perbaikan');
                      },
                    ),
                  ),
                ],
              )),
          inputField('Consumable', _consumableController, 'consumable'),
          inputField('Penganggung jawab', _pjController, 'penganggung jawab'),
          inputField('Spare part', _sparePartController, 'spare part'),
          inputField('Keterangan', _keteranganController, 'keterangan'),
          RaisedButton(
              child: Text('Simpan'),
              onPressed: () {
                _modeTambah
                    ? tambahRepair(
                        namaMesin,
                        _tanggalRusak.text,
                        _tanggalPerbaikan.text,
                        _consumableController.text,
                        _pjController.text,
                        _sparePartController.text,
                        _keteranganController.text)
                    : ubahRepair(
                        namaMesin,
                        _tanggalRusak.text,
                        _tanggalPerbaikan.text,
                        _consumableController.text,
                        _pjController.text,
                        _sparePartController.text,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width * 0.20,
                child: Text(
                  leading,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            Container(
              width: MediaQuery.of(context).size.width * 0.70,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(hintText: hint),
              ),
            ),
          ],
        ));
  }
}
