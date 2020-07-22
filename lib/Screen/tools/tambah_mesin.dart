import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/laporan/harian.dart';
<<<<<<< HEAD
import 'package:maintenance_apps/Screen/tools/list_mesin.dart';
import 'package:maintenance_apps/models/mesin.dart';
=======
>>>>>>> f8e560173d0b0054a6e7950168e75ef4c3edfd9c
import 'package:maintenance_apps/shared/loading.dart';

class TambahMesin extends StatefulWidget {
  final String mode;
  final Mesin mesin;
  TambahMesin(this.mesin, this.mode);
  @override
  _TambahMesinState createState() => _TambahMesinState();
}

class _TambahMesinState extends State<TambahMesin> {
<<<<<<< HEAD
  List listJenisMesin = ["AMG", "COPYMPEX", "FICEP"];
  String jenisMesin;

=======
>>>>>>> f8e560173d0b0054a6e7950168e75ef4c3edfd9c
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
<<<<<<< HEAD
        title: _modeTambah ? Text('Input Mesin Baru') : Text('Edit Data Mesin'),
=======
        title: Text('Input Mesin Baru'),
>>>>>>> f8e560173d0b0054a6e7950168e75ef4c3edfd9c
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
                        'Jenis Mesin',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
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
                ],
              )),
          inputField('Kode', _kodeController, 'kode mesin'),
          inputField('Nama Mesin', _namaController, 'nama mesin'),
          inputField('Kapasitas', _kapasitasController, 'kapasitas'),
          inputField('Jumlah', _jumlahController, 'jumlah'),
          inputField('Lokasi', _lokasiController, 'lokasi'),
          inputField('Keterangan', _keteranganController, 'keterangan'),
          RaisedButton(
              child: Text('Simpan'),
              onPressed: () {
<<<<<<< HEAD
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
=======
                tambahMesin();
              })
>>>>>>> f8e560173d0b0054a6e7950168e75ef4c3edfd9c
        ],
      ),
    );
  }

<<<<<<< HEAD
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
=======
  Widget inputField(
      String leading, TextEditingController controller, String hint) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: hint),
      ),
    );
>>>>>>> f8e560173d0b0054a6e7950168e75ef4c3edfd9c
  }

  Future<Widget> tambahMesin() async {
    String kode = _kodeController.text;
    String nama = _namaController.text;
<<<<<<< HEAD
    String jenis = jenisMesin;
=======
    String jenis = _jenisController.text;
>>>>>>> f8e560173d0b0054a6e7950168e75ef4c3edfd9c
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
<<<<<<< HEAD
      jenisMesin = null;
=======
>>>>>>> f8e560173d0b0054a6e7950168e75ef4c3edfd9c
      return Loading();
    });
  }
}
