import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/models/consumable.dart';
import 'package:maintenance_apps/shared/constant.dart';

class TambahConsumable extends StatefulWidget {
  final Consumable consumable;
  final String mode;
  TambahConsumable(this.consumable, this.mode);
  @override
  _TambahConsumableState createState() => _TambahConsumableState();
}

class _TambahConsumableState extends State<TambahConsumable> {
  bool _modeTambah = true;
  double s;

  CollectionReference consumableCollection =
      Firestore.instance.collection('consumable');

  TextEditingController _namaController = TextEditingController();
  TextEditingController _jenisController = TextEditingController();
  TextEditingController _partController = TextEditingController();
  TextEditingController _jumlahController = TextEditingController();
  TextEditingController _keteranganController = TextEditingController();

  @override
  void initState() {
    if (widget.mode != 'tambah') {
      _modeTambah = false;
      _namaController.text = widget.consumable.nama;
      _jenisController.text = widget.consumable.jenis;
      _partController.text = widget.consumable.part;
      _keteranganController.text = widget.consumable.keterangan;
      _jumlahController.text = widget.consumable.jumlah;
    }
    super.initState();
  }

  tambahConsumable(String nama, String jenis, String part, String jumlah,
      String keterangan) async {
    await consumableCollection.add({
      'id': consumableCollection.id,
      'jenis': jenis,
      'part': part,
      'nama': nama,
      'jumlah': jumlah,
      'keterangan': keterangan,
    }).then((value) {
      value.updateData({'id': value.documentID});
      _namaController.clear();
      _jenisController.clear();
      _partController.clear();
      _keteranganController.clear();
      _jumlahController.clear();
    });
  }

  ubahConsumable(String nama, String jenis, String part, String jumlah,
      String keterangan) async {
    print(widget.consumable.id);
    await consumableCollection.document(widget.consumable.id).setData({
      'id': widget.consumable.id,
      'jenis': jenis,
      'part': part,
      'nama': nama,
      'jumlah': jumlah,
      'keterangan': keterangan,
    }).whenComplete(() {
      _namaController.clear();
      _jenisController.clear();
      _partController.clear();
      _keteranganController.clear();
      _jumlahController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    s = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Tambah data consumable".toUpperCase()),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(s * 0.1, 10, s * 0.1, 0),
        children: [
          inputField('Nama Consumable', _namaController, 'consumable'),
          inputField('Jenis Mesin', _jenisController, 'penganggung jawab'),
          inputField('Part Mesin', _partController, 'spare part'),
          inputField('Jumlah', _jumlahController, 'jumlah'),
          inputField('Keterangan', _keteranganController, 'keterangan'),
          Padding(
            padding: EdgeInsets.fromLTRB(s * 0.2, 0, s * 0.2, 0),
            child: RaisedButton(
                color: Colors.blue[200],
                child: Text('Simpan'),
                onPressed: () {
                  _modeTambah
                      ? tambahConsumable(
                          _namaController.text,
                          _jenisController.text,
                          _partController.text,
                          _jumlahController.text,
                          _keteranganController.text)
                      : ubahConsumable(
                          _namaController.text,
                          _jenisController.text,
                          _partController.text,
                          _jumlahController.text,
                          _keteranganController.text);
                }),
          )
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
        decoration: textInputDecoration.copyWith(
          labelText: leading,
          hintText: hint,
        ),
      ),
    );
  }
}
