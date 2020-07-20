import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/laporan/harian.dart';
import 'package:maintenance_apps/Screen/tools/list_mesin.dart';
import 'package:maintenance_apps/models/mesin.dart';
import 'package:maintenance_apps/shared/loading.dart';

class TambahMesin extends StatefulWidget {
  final String mode;
  final Mesin mesin;
  TambahMesin(this.mesin, this.mode);
  @override
  _TambahMesinState createState() => _TambahMesinState();
}

class _TambahMesinState extends State<TambahMesin> {
  List listJenisMesin = ["AMG", "COPYMPEX", "FICEP"];
  String jenisMesin;

  TextEditingController _namaController = TextEditingController();
  TextEditingController _jenisController = TextEditingController();
  TextEditingController _kapasitasController = TextEditingController();
  TextEditingController _jumlahController = TextEditingController();
  TextEditingController _lokasiController = TextEditingController();
  TextEditingController _keteranganController = TextEditingController();
  TextEditingController _kodeController = TextEditingController();

  bool _modeTambah = true;

  @override
  void initState() {
    if (widget.mode != 'tambah') {
      _modeTambah = false;
      _namaController.text = widget.mesin.nama;
      jenisMesin = widget.mesin.jenis;
      _kapasitasController.text = widget.mesin.kapasitas;
      _jumlahController.text = widget.mesin.jumlah;
      _lokasiController.text = widget.mesin.lokasi;
      _keteranganController.text = widget.mesin.keterangan;
      _kodeController.text = widget.mesin.kode;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _modeTambah ? Text('Input Mesin Baru') : Text('Edit Data Mesin'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
                hint: Text('jenis mesin'),
                value: jenisMesin,
                items: listJenisMesin.map((e) {
                  return DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    jenisMesin = value;
                  });
                }),
          ),
          inputField('Kode', _kodeController, 'kode mesin'),
          inputField('Nama Mesin', _namaController, 'nama mesin'),
          inputField('Kapasitas', _kapasitasController, 'kapasitas'),
          inputField('Jumlah', _jumlahController, 'jumlah'),
          inputField('Lokasi', _lokasiController, 'lokasi'),
          inputField('Keterangan', _keteranganController, 'keterangan'),
          RaisedButton(
              child: Text('Simpan'),
              onPressed: () {
                _modeTambah ? tambahMesin() : editMesin();
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

  editMesin() async {
    String kode = _kodeController.text;
    String nama = _namaController.text;
    String jenis = jenisMesin;
    String kapasitas = _kapasitasController.text;
    String jumlah = _jumlahController.text;
    String lokasi = _lokasiController.text;
    String keterangan = _keteranganController.text;

    Mesin mesin =
        Mesin(nama, jenis, kode, kapasitas, jumlah, lokasi, keterangan);
    await Firestore.instance
        .collection('mesin')
        .document(widget.mesin.kode)
        .setData(mesin.toJson())
        .whenComplete(() {
      print('berhasil mengubah data');
      _kodeController.clear();
      _namaController.clear();
      _jenisController.clear();
      _kapasitasController.clear();
      _jumlahController.clear();
      _lokasiController.clear();
      _keteranganController.clear();
      jenisMesin = null;
    });
  }

  Future<Widget> tambahMesin() async {
    String kode = _kodeController.text;
    String nama = _namaController.text;
    String jenis = jenisMesin;
    String kapasitas = _kapasitasController.text;
    String jumlah = _jumlahController.text;
    String lokasi = _lokasiController.text;
    String keterangan = _keteranganController.text;

    await database
        .addMesin(kode, nama, jenis, kapasitas, jumlah, lokasi, keterangan)
        .then((value) {})
        .whenComplete(() {
      _kodeController.clear();
      _namaController.clear();
      _jenisController.clear();
      _kapasitasController.clear();
      _jumlahController.clear();
      _lokasiController.clear();
      _keteranganController.clear();
      jenisMesin = null;
      return Loading();
    });
  }
}
