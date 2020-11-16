import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/tools/components/inputField.dart';
import 'package:maintenance_apps/Screen/tools/dialog.dart';
import 'package:maintenance_apps/models/outConsumable.dart';
import 'package:maintenance_apps/Screen/tools/components/form.dart' as form;
import 'package:maintenance_apps/shared/loading.dart';

class TambahOutConsumable extends StatefulWidget {
  final OutConsumable outConsumable;
  final bool isTambah;

  TambahOutConsumable({this.isTambah, this.outConsumable});
  @override
  _TambahOutConsumableState createState() => _TambahOutConsumableState();
}

class _TambahOutConsumableState extends State<TambahOutConsumable> {
  OutConsumable outConsumable;

  final CollectionReference outConsumableCollection =
      Firestore.instance.collection('outconsumable');
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
      _namaController.text = widget.outConsumable.nama;
      _tipeController.text = widget.outConsumable.tipe;
      _tanggalController.text = widget.outConsumable.tanggal;
      _teknisiController.text = widget.outConsumable.teknisi;
      _partController.text = widget.outConsumable.part;
      _kapasitasController.text = widget.outConsumable.kapasitas;
      _adminController.text = widget.outConsumable.admin;
      _jumlahController.text = widget.outConsumable.jumlah;
      _keteranganController.text = widget.outConsumable.keterangan;
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
      appBarTitle: _modeTambah
          ? "Tambah data out consumable"
          : "Ubah data out consumable",
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
                leading: "Nama Consumable",
                hint: "nama consumable",
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
                      outConsumable = OutConsumable(
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
                          ? tambahData(outConsumable)
                          : ubahData(outConsumable);
                    }),
              )
            ],
    );
  }

  tambahData(OutConsumable outConsumable) async {
    setState(() {
      _isLoading = true;
    });
    await outConsumableCollection.add(outConsumable.toJson()).then((value) {
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
            pesan: 'Berhasil menambah data baru out consumable');
      }
    }).timeout(Duration(seconds: 10), onTimeout: () {
      showAlert(
          tipe: 'gagal', pesan: "Gagal. Mohon periksa koneksi internet anda!");
      return;
    });
  }

  ubahData(OutConsumable outConsumable) async {
    await outConsumableCollection
        .document(widget.outConsumable.id)
        .updateData(outConsumable.toJson())
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
          tipe: 'berhasil', pesan: 'Berhasil mengubah data out consumable');
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
