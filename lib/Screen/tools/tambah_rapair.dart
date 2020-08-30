import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/tools/dialog.dart';
import 'package:maintenance_apps/models/mesin.dart';
import 'package:maintenance_apps/models/repair.dart';
import 'package:maintenance_apps/shared/constant.dart';
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
  bool _isLoading = false;
  bool _modeTambah = true;
  TextEditingController _tipeController = TextEditingController();
  TextEditingController _tanggalRusak = TextEditingController();
  TextEditingController _tanggalPerbaikan = TextEditingController();
  TextEditingController _consumableController = TextEditingController();
  TextEditingController _keteranganController = TextEditingController();
  TextEditingController _pjController = TextEditingController();
  TextEditingController _sparePartController = TextEditingController();
  TextEditingController _noInventarisController = TextEditingController();
  TextEditingController _lokasiController = TextEditingController();
  TextEditingController _jumlahController = TextEditingController();
  DateTime waktu = DateTime.now();

  DateTime tanggalRusak = DateTime.now();
  DateTime tanggalPerbaikan = DateTime.now();

  String namaMesin;

  double s;

  CollectionReference collection = Firestore.instance.collection('repair');

  @override
  void initState() {
    if (widget.mode != 'tambah') {
      _modeTambah = false;
      namaMesin = widget.repair.nama;
      _jumlahController.text = widget.repair.jumlah;
      _lokasiController.text = widget.repair.lokasi;
      _noInventarisController.text = widget.repair.noInventaris;
      _tanggalRusak.text = widget.repair.tanggalRusak;
      _tanggalPerbaikan.text = widget.repair.tanggalPerbaikan;
      _consumableController.text = widget.repair.consumable;
      _keteranganController.text = widget.repair.keterangan;
      _pjController.text = widget.repair.pj;
      _sparePartController.text = widget.repair.sparePart;
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

  tambahRepair(
      String noInventaris,
      String nama,
      String tanggalRusak,
      String tanggalPerbaikan,
      String consumable,
      String jumlah,
      String penanggungJawab,
      String sparePart,
      String lokasi,
      String keterangan) async {
    setState(() {
      _isLoading = true;
    });
    await collection.add({
      'no_inventaris': noInventaris,
      'jenis mesin': widget.mesin.listMesin[0].jenis,
      'teknisi': penanggungJawab,
      'spare part': sparePart,
      'nama': nama,
      'tanggal rusak': tanggalRusak,
      'tanggal perbaikan': tanggalPerbaikan,
      'consumable': consumable,
      'jumlah': jumlah,
      'lokasi': lokasi,
      'keterangan': keterangan,
      'time': waktu
    }).then((value) {
      if (value.documentID != null) {
        setState(() {
          value.updateData({'id': value.documentID});
          namaMesin = null;
          _noInventarisController.clear();
          _lokasiController.clear();
          _tanggalRusak.clear();
          _tanggalPerbaikan.clear();
          _consumableController.clear();
          _keteranganController.clear();
          _tipeController.clear();
          _jumlahController.clear();
          _pjController.clear();
          _sparePartController.clear();
          _isLoading = false;
        });
        showAlert(
            tipe: 'berhasil', pesan: 'Berhasil menambah data repair baru');
      }
    }).timeout(Duration(seconds: 10), onTimeout: () {
      showAlert(
          tipe: 'gagal', pesan: 'Gagal. Mohon periksa koneksi internet anda');
      return;
    });
  }

  ubahRepair(
      String noInventaris,
      String nama,
      String tanggalRusak,
      String tanggalPerbaikan,
      String consumable,
      String jumlah,
      String penanggungJawab,
      String sparePart,
      String lokasi,
      String keterangan) async {
    setState(() {
      _isLoading = true;
    });
    await collection.document(widget.repair.id).setData({
      'id': widget.repair.id,
      'no_inventaris': noInventaris,
      'jenis mesin': widget.mesin.listMesin[0].jenis,
      'teknisi': penanggungJawab,
      'spare part': sparePart,
      'nama': nama,
      'tanggal rusak': tanggalRusak,
      'tanggal perbaikan': tanggalPerbaikan,
      'consumable': consumable,
      'jumlah': jumlah,
      'lokasi': lokasi,
      'keterangan': keterangan,
      'time': waktu
    }).then((value) {
      setState(() {
        namaMesin = null;
        _noInventarisController.clear();
        _lokasiController.clear();
        _tanggalRusak.clear();
        _tanggalPerbaikan.clear();
        _consumableController.clear();
        _keteranganController.clear();
        _tipeController.clear();
        _jumlahController.clear();
        _pjController.clear();
        _sparePartController.clear();
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
    s = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Tambah data perbaikan mesin".toUpperCase()),
      ),
      body: _isLoading
          ? Loading()
          : ListView(
              padding: EdgeInsets.fromLTRB(s * 0.1, 10, s * 0.1, 0),
              children: [
                inputField(
                    'No Inventaris', _noInventarisController, 'no inventaris'),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InputDecorator(
                      decoration: textInputDecoration.copyWith(
                          labelText: "Jenis Mesin", hintText: "jenis mesin"),
                      child: DropdownButton(
                        isDense: true,
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
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: TextField(
                      controller: _tanggalRusak,
                      decoration: textInputDecoration.copyWith(
                          labelText: "Tanggal Kerusakan Mesin",
                          hintText: 'tanggal kerusakan mesin'),
                      onTap: () {
                        _pilihTanggal(context, 'rusak');
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: TextField(
                      controller: _tanggalPerbaikan,
                      decoration: textInputDecoration.copyWith(
                          labelText: "Tanggal Perbaikan Mesin",
                          hintText: 'tanggal perbaikan mesin'),
                      onTap: () {
                        _pilihTanggal(context, 'perbaikan');
                      },
                    ),
                  ),
                ),
                inputField('Consumable', _consumableController, 'consumable'),
                inputField('Jumlah', _jumlahController, 'jumlah'),
                inputField('Teknisi', _pjController, 'teknisi'),
                inputField('Spare part', _sparePartController, 'spare part'),
                inputField('Lokasi', _lokasiController, 'lokasi'),
                inputField('Keterangan', _keteranganController, 'keterangan'),
                Padding(
                  padding: EdgeInsets.fromLTRB(s * 0.2, 0, s * 0.2, 0),
                  child: RaisedButton(
                      color: Colors.blue[200],
                      child: Text('Simpan'),
                      onPressed: () {
                        _modeTambah
                            ? tambahRepair(
                                _noInventarisController.text,
                                namaMesin,
                                _tanggalRusak.text,
                                _tanggalPerbaikan.text,
                                _consumableController.text,
                                _jumlahController.text,
                                _pjController.text,
                                _sparePartController.text,
                                _lokasiController.text,
                                _keteranganController.text)
                            : ubahRepair(
                                _noInventarisController.text,
                                namaMesin,
                                _tanggalRusak.text,
                                _tanggalPerbaikan.text,
                                _consumableController.text,
                                _jumlahController.text,
                                _pjController.text,
                                _sparePartController.text,
                                _lokasiController.text,
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
