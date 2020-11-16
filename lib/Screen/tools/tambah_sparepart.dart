import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/tools/components/form.dart' as form;
import 'package:maintenance_apps/Screen/tools/components/inputField.dart';
import 'package:maintenance_apps/Screen/tools/dialog.dart';
import 'package:maintenance_apps/models/sparepart.dart';
import 'package:maintenance_apps/shared/loading.dart';

class TambahSparePart extends StatefulWidget {
  final SparePart sparePart;
  final bool isTambah;
  TambahSparePart({
    this.isTambah,
    this.sparePart,
  });
  @override
  _TambahSparePartState createState() => _TambahSparePartState();
}

class _TambahSparePartState extends State<TambahSparePart> {
  CollectionReference collectionReference =
      Firestore.instance.collection('sparepart');

  TextEditingController _namaController = TextEditingController();
  TextEditingController _tipeController = TextEditingController();
  TextEditingController _kapasitasController = TextEditingController();
  TextEditingController _tanggalDatangController = TextEditingController();
  TextEditingController _partController = TextEditingController();
  TextEditingController _jumlahController = TextEditingController();
  TextEditingController _keteranganController = TextEditingController();

  DateTime tanggalDatang = DateTime.now();

  DateTime waktu = DateTime.now();

  bool _isLoading = false;
  bool _modeTambah = true;

  @override
  void initState() {
    if (!widget.isTambah) {
      _namaController.text = widget.sparePart.nama;
      _tipeController.text = widget.sparePart.tipe;
      _tanggalDatangController.text = widget.sparePart.tanggalDatang;
      _kapasitasController.text = widget.sparePart.kapasitas;
      _partController.text = widget.sparePart.part;
      _jumlahController.text = widget.sparePart.jumlah;
      _keteranganController.text = widget.sparePart.keterangan;
      _modeTambah = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return form.Form(
      appBarTitle:
          _modeTambah ? "Tambah data spare part" : "Ubah data sparepart",
      formField: _isLoading
          ? [Container(height: s.height, child: Loading())]
          : [
              Input(
                leading: "Nama",
                hint: "nama sparepart",
                controller: _namaController,
              ),
              Input(
                leading: "Tipe",
                hint: "tipe sparepart",
                controller: _tipeController,
              ),
              Input(
                leading: "Kapasitas",
                hint: "kapasitas",
                controller: _kapasitasController,
              ),
              Input(
                leading: "Tanggal Datang",
                hint: "tanggal datang",
                controller: _tanggalDatangController,
                onTap: () {
                  _pilihTanggal(context);
                },
              ),
              Input(
                leading: "Part Mesin",
                hint: 'part mesin',
                controller: _partController,
              ),
              Input(
                leading: "Jumlah",
                hint: "jumlah",
                controller: _jumlahController,
              ),
              Input(
                leading: "Keterangan",
                hint: "keterngan",
                controller: _keteranganController,
              ),
              Padding(
                padding:
                    EdgeInsets.fromLTRB(s.width * 0.2, 0, s.width * 0.2, 0),
                child: RaisedButton(
                    color: Colors.blue[200],
                    child: Text('Simpan'),
                    onPressed: () {
                      _modeTambah
                          ? _tambahSparePart(
                              _namaController.text,
                              _tipeController.text,
                              _kapasitasController.text,
                              _tanggalDatangController.text,
                              _partController.text,
                              _jumlahController.text,
                              _keteranganController.text)
                          : ubahSparePart(
                              _namaController.text,
                              _tipeController.text,
                              _kapasitasController.text,
                              _tanggalDatangController.text,
                              _partController.text,
                              _jumlahController.text,
                              _keteranganController.text);
                    }),
              )
            ],
    );
  }

  Future<Null> _pilihTanggal(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: tanggalDatang,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != tanggalDatang)
      setState(() {
        tanggalDatang = picked;
        _tanggalDatangController.text = tanggalDatang.toString().split(' ')[0];
      });
  }

  _tambahSparePart(String nama, String tipe, String kapasitas, String tanggal,
      String part, String jumlah, String keterangan) async {
    setState(() {
      _isLoading = true;
    });
    await collectionReference.add({
      "nama": nama,
      "tipe": tipe,
      "kapasitas": kapasitas,
      "tanggal_datang": tanggal,
      "part_mesin": part,
      "jumlah": jumlah,
      "keterangan": keterangan
    }).then((value) {
      if (value.documentID != null) {
        setState(() {
          value.updateData({'id': value.documentID});
          _namaController.clear();
          _tipeController.clear();
          _tanggalDatangController.clear();
          _kapasitasController.clear();
          _partController.clear();
          _jumlahController.clear();
          _keteranganController.clear();
          _isLoading = false;
        });
        showAlert(
            tipe: 'berhasil', pesan: 'Berhasil menambah data sparepart baru');
      }
    }).timeout(Duration(seconds: 10), onTimeout: () {
      showAlert(
          tipe: 'gagal', pesan: "Gagal. Mohon periksa koneksi internet anda!");
      return;
    });
  }

  ubahSparePart(String nama, String tipe, String kapasitas, String tanggal,
      String part, String jumlah, String keterangan) async {
    setState(() {
      _isLoading = true;
    });
    await collectionReference.document(widget.sparePart.id).updateData({
      'nama': nama,
      'tipe': tipe,
      'kapasitas': kapasitas,
      'tanggal_datang': tanggal,
      'part_mesin': part,
      'jumlah': jumlah,
      'keterangan': keterangan
    }).then((value) {
      setState(() {
        _namaController.clear();
        _tipeController.clear();
        _kapasitasController.clear();
        _tanggalDatangController.clear();
        _partController.clear();
        _jumlahController.clear();
        _keteranganController.clear();
        _isLoading = false;
      });
      showAlert(tipe: 'berhasil', pesan: 'Berhasil mengubah data repair');
    }).timeout(Duration(seconds: 10), onTimeout: () {
      showAlert(
          tipe: 'berhasil',
          pesan: 'Gagal. Mohon periksa koneksi internet anda');
      return;
    });
  }

  Future<Null> showAlert({String pesan, String tipe}) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return DialogWidget(
            pesan: pesan,
            tipe: tipe,
          );
        });
  }
}
