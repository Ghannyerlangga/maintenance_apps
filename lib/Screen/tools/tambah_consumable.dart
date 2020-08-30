import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/tools/dialog.dart';
import 'package:maintenance_apps/models/consumable.dart';
import 'package:maintenance_apps/shared/constant.dart';
import 'package:maintenance_apps/shared/loading.dart';

class TambahConsumable extends StatefulWidget {
  final Consumable consumable;
  final String mode;
  TambahConsumable(this.consumable, this.mode);
  @override
  _TambahConsumableState createState() => _TambahConsumableState();
}

class _TambahConsumableState extends State<TambahConsumable> {
  bool _isLoading = false;
  bool _modeTambah = true;
  double s;

  DateTime tanggalDatang = DateTime.now();

  CollectionReference consumableCollection =
      Firestore.instance.collection('consumable');

  TextEditingController _namaController = TextEditingController();
  TextEditingController _jenisController = TextEditingController();
  TextEditingController _partController = TextEditingController();
  TextEditingController _jumlahController = TextEditingController();
  TextEditingController _tanggalDatangController = TextEditingController();
  TextEditingController _kapasitasController = TextEditingController();
  TextEditingController _keteranganController = TextEditingController();

  @override
  void initState() {
    if (widget.mode != 'tambah') {
      _modeTambah = false;
      _tanggalDatangController.text = widget.consumable.tanggalDatang;
      _kapasitasController.text = widget.consumable.kapasitas;
      _namaController.text = widget.consumable.nama;
      _jenisController.text = widget.consumable.jenis;
      _partController.text = widget.consumable.part;
      _keteranganController.text = widget.consumable.keterangan;
      _jumlahController.text = widget.consumable.jumlah;
    }
    super.initState();
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

  tambahConsumable(String nama, String jenis, String part, String tanggalDatang,
      String kapasitas, String jumlah, String keterangan) async {
    setState(() {
      _isLoading = true;
    });
    await consumableCollection.add({
      'tanggal_datang': tanggalDatang,
      'jenis': jenis,
      'part': part,
      'kapasitas': kapasitas,
      'nama': nama,
      'jumlah': jumlah,
      'keterangan': keterangan,
    }).then((value) {
      if (value.documentID != null) {
        setState(() {
          value.updateData({'id': value.documentID});
          _namaController.clear();
          _jenisController.clear();
          _partController.clear();
          _keteranganController.clear();
          _jumlahController.clear();
          _tanggalDatangController.clear();
          _kapasitasController.clear();
          _isLoading = false;
        });

        showAlert(
            tipe: 'berhasil', pesan: 'Berhasil menambah data consumable baru');
      } else if (value.documentID == null) {
        showAlert(tipe: 'gagal', pesan: 'Gagal menambah data consumable baru');
      }
    }).timeout(Duration(seconds: 10), onTimeout: () {
      setState(() {
        _isLoading = false;
      });
      showAlert(
          tipe: 'gagal', pesan: 'Gagal. Mohon periksa koneksi internet anda');
      return;
    });
  }

  ubahConsumable(String nama, String jenis, String part, String tanggalDatang,
      String kapasitas, String jumlah, String keterangan) async {
    setState(() {
      _isLoading = true;
    });
    print(widget.consumable.id);
    await consumableCollection.document(widget.consumable.id).updateData({
      'jenis': jenis,
      'part': part,
      'nama': nama,
      'jumlah': jumlah,
      'keterangan': keterangan,
      'tanggal_datang': tanggalDatang,
      'kapasitas': kapasitas,
    }).then((value) {
      setState(() {
        _namaController.clear();
        _jenisController.clear();
        _partController.clear();
        _keteranganController.clear();
        _jumlahController.clear();
        _tanggalDatangController.clear();
        _kapasitasController.clear();
        _isLoading = false;
      });
      showAlert(tipe: 'berhasil', pesan: 'Berhasil mengubah data consumable');
    }).timeout(Duration(seconds: 10), onTimeout: () {
      setState(() {
        _isLoading = false;
      });
      showAlert(
          tipe: 'gagal', pesan: 'Gagal. Mohon periksa koneksi internet anda');
      return;
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
      body: _isLoading
          ? Loading()
          : ListView(
              padding: EdgeInsets.fromLTRB(s * 0.1, 10, s * 0.1, 0),
              children: [
                inputField('Nama Consumable', _namaController, 'consumable'),
                inputField('Jenis Mesin', _jenisController, 'jenis mesin'),
                inputField('Part Mesin', _partController, 'spare part'),
                inputField('Kapasitas', _kapasitasController, 'kapasitas'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: TextField(
                      controller: _tanggalDatangController,
                      decoration: textInputDecoration.copyWith(
                          labelText: "Tanggal Kedatangan",
                          hintText: 'tanggal kedatangan'),
                      onTap: () {
                        _pilihTanggal(context);
                      },
                    ),
                  ),
                ),
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
                                _tanggalDatangController.text,
                                _kapasitasController.text,
                                _jumlahController.text,
                                _keteranganController.text)
                            : ubahConsumable(
                                _namaController.text,
                                _jenisController.text,
                                _partController.text,
                                _tanggalDatangController.text,
                                _kapasitasController.text,
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
