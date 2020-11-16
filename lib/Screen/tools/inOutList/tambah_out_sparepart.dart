import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/tools/components/inputField.dart';
import 'package:maintenance_apps/Screen/tools/dialog.dart';
import 'package:maintenance_apps/models/outSparePart.dart';
import 'package:maintenance_apps/Screen/tools/components/form.dart' as form;
import 'package:maintenance_apps/shared/loading.dart';

class TambahOutSparePart extends StatefulWidget {
  final OutSparePart outSparePart;
  final bool isTambah;

  TambahOutSparePart({this.isTambah, this.outSparePart});
  @override
  _TambahOutSparePartState createState() => _TambahOutSparePartState();
}

class _TambahOutSparePartState extends State<TambahOutSparePart> {
  OutSparePart outSparePart;

  final CollectionReference outSparePartCollection =
      Firestore.instance.collection('outsparepart');
  DateTime tanggal = DateTime.now();
  bool _modeTambah = true;
  bool _isLoading = false;

  TextEditingController _namaController = TextEditingController();
  TextEditingController _tipeController = TextEditingController();
  TextEditingController _kapasitasController = TextEditingController();
  TextEditingController _jumlahController = TextEditingController();
  TextEditingController _partController = TextEditingController();
  TextEditingController _tanggalController = TextEditingController();
  TextEditingController _teknisiController = TextEditingController();
  TextEditingController _adminController = TextEditingController();
  TextEditingController _keteranganController = TextEditingController();

  @override
  void initState() {
    if (!widget.isTambah) {
      _namaController.text = widget.outSparePart.nama;
      _tipeController.text = widget.outSparePart.tipe;
      _tanggalController.text = widget.outSparePart.tanggal;
      _teknisiController.text = widget.outSparePart.teknisi;
      _partController.text = widget.outSparePart.part;
      _kapasitasController.text = widget.outSparePart.kapasitas;
      _adminController.text = widget.outSparePart.admin;
      _jumlahController.text = widget.outSparePart.jumlah;
      _keteranganController.text = widget.outSparePart.keterangan;
      _modeTambah = false;
    }
    super.initState();
  }

  Future<Null> _pilihTanggal(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: tanggal,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != tanggal)
      setState(() {
        tanggal = picked;
        _tanggalController.text = tanggal.toString().split(' ')[0];
      });
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return form.Form(
      appBarTitle:
          _modeTambah ? "Tambah data out sparepart" : "Ubah data out sparepart",
      formField: _isLoading
          ? [
              Container(
                width: s.width,
                height: s.height,
                child: Loading(),
              )
            ]
          : [
              Input(
                leading: "Nama Spare Part",
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
                leading: "Jumlah",
                hint: "jumlah",
                controller: _jumlahController,
              ),
              Input(
                  leading: "Part Mesin",
                  hint: "part mesin",
                  controller: _partController),
              Input(
                leading: "Tanggal",
                hint: "tanggal",
                controller: _tanggalController,
                onTap: () {
                  _pilihTanggal(context);
                },
              ),
              Input(
                leading: "Teknisi",
                hint: "teknisi",
                controller: _teknisiController,
              ),
              Input(
                leading: "Admin",
                hint: "admin",
                controller: _adminController,
              ),
              Input(
                leading: "Keterangan",
                hint: "keterangan",
                controller: _keteranganController,
              ),
              Padding(
                padding:
                    EdgeInsets.fromLTRB(s.width * 0.2, 0, s.width * 0.2, 0),
                child: RaisedButton(
                    color: Colors.blue[200],
                    child: Text('Simpan'),
                    onPressed: () {
                      outSparePart = OutSparePart(
                          nama: _namaController.text,
                          tipe: _tipeController.text,
                          kapasitas: _kapasitasController.text,
                          jumlah: _jumlahController.text,
                          part: _partController.text,
                          tanggal: _tanggalController.text,
                          teknisi: _teknisiController.text,
                          admin: _adminController.text,
                          keterangan: _keteranganController.text);
                      _modeTambah
                          ? tambahData(outSparePart)
                          : ubahData(outSparePart);
                    }),
              )
            ],
    );
  }

  tambahData(OutSparePart outSparePart) async {
    setState(() {
      _isLoading = true;
    });
    await outSparePartCollection.add(outSparePart.toJson()).then((value) {
      if (value.documentID != null) {
        setState(() {
          value.updateData({'id': value.documentID});
          _namaController.clear();
          _tipeController.clear();
          _tanggalController.clear();
          _teknisiController.clear();
          _kapasitasController.clear();
          _adminController.clear();
          _jumlahController.clear();
          _partController.clear();
          _adminController.clear();
          _keteranganController.clear();
          _isLoading = false;
        });
        showAlert(
            tipe: 'berhasil',
            pesan: 'Berhasil menambah data baru out sparepart');
      }
    }).timeout(Duration(seconds: 10), onTimeout: () {
      showAlert(
          tipe: 'gagal', pesan: "Gagal. Mohon periksa koneksi internet anda!");
      return;
    });
  }

  ubahData(OutSparePart outSparePart) async {
    await outSparePartCollection
        .document(widget.outSparePart.id)
        .updateData(outSparePart.toJson())
        .then((value) {
      setState(() {
        _namaController.clear();
        _tipeController.clear();
        _tanggalController.clear();
        _teknisiController.clear();
        _kapasitasController.clear();
        _adminController.clear();
        _jumlahController.clear();
        _partController.clear();
        _adminController.clear();
        _keteranganController.clear();
        _isLoading = false;
      });
      showAlert(
          tipe: 'berhasil', pesan: 'Berhasil mengubah data out sparepart');
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
