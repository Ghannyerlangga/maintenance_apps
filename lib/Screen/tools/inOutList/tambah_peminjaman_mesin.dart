import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/tools/components/form.dart' as form;
import 'package:maintenance_apps/Screen/tools/components/inputField.dart';
import 'package:maintenance_apps/Screen/tools/dialog.dart';
import 'package:maintenance_apps/models/peminjaman_mesin.dart';
import 'package:maintenance_apps/models/sparepart.dart';
import 'package:maintenance_apps/shared/loading.dart';

class TambahPeminjamanMesin extends StatefulWidget {
  final PeminjamanMesin peminjamanMesin;
  final bool isTambah;
  TambahPeminjamanMesin({
    this.isTambah,
    this.peminjamanMesin,
  });
  @override
  _TambahPeminjamanMesinState createState() => _TambahPeminjamanMesinState();
}

class _TambahPeminjamanMesinState extends State<TambahPeminjamanMesin> {
  CollectionReference collectionReference =
      Firestore.instance.collection('peminjamanmesin');

  TextEditingController _noInventarisController = TextEditingController();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _tipeController = TextEditingController();
  TextEditingController _kapasitasController = TextEditingController();
  TextEditingController _tanggalPeminjamanController = TextEditingController();
  TextEditingController _tanggalRencanaKembaliController =
      TextEditingController();
  TextEditingController _tanggalKembaliController = TextEditingController();
  TextEditingController _penggunaController = TextEditingController();
  TextEditingController _noHpController = TextEditingController();
  TextEditingController _adminController = TextEditingController();
  TextEditingController _jumlahController = TextEditingController();
  TextEditingController _keteranganController = TextEditingController();

  DateTime tanggalPeminjaman = DateTime.now();
  DateTime tanggalRencanaKembali = DateTime.now();
  DateTime tanggalKembali = DateTime.now();

  DateTime waktu = DateTime.now();

  bool _isLoading = false;
  bool _modeTambah = true;

  @override
  void initState() {
    if (!widget.isTambah) {
      _noInventarisController.text = widget.peminjamanMesin.noInventaris;
      _namaController.text = widget.peminjamanMesin.nama;
      _tipeController.text = widget.peminjamanMesin.tipe;
      _tanggalPeminjamanController.text = widget.peminjamanMesin.tanggalPinjam;
      _tanggalRencanaKembaliController.text =
          widget.peminjamanMesin.tanggalRencanaKembali;
      _tanggalKembaliController.text = widget.peminjamanMesin.tanggalKembali;
      _kapasitasController.text = widget.peminjamanMesin.kapasitas;
      _adminController.text = widget.peminjamanMesin.admin;
      _jumlahController.text = widget.peminjamanMesin.jumlah;
      _penggunaController.text = widget.peminjamanMesin.pengguna;
      _noHpController.text = widget.peminjamanMesin.noHP;
      _keteranganController.text = widget.peminjamanMesin.keterangan;
      _modeTambah = false;
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return form.Form(
      appBarTitle: _modeTambah
          ? "Tambah data peminjamanm mesin"
          : "Ubah data peminjaman mesin",
      formField: _isLoading
          ? [Container(height: s.height, child: Loading())]
          : [
              Input(
                leading: "No Inventaris",
                hint: "no inventaris",
                controller: _noInventarisController,
              ),
              Input(
                leading: "Nama Alat",
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
                leading: "Tanggal Peminjaman",
                hint: "tanggal peminjaman",
                controller: _tanggalPeminjamanController,
                onTap: () {
                  _pilihTanggal(context, 'pinjam');
                },
              ),
              Input(
                leading: "Tanggal Rencana Pengembalian",
                hint: "tanggal rencana pengembalian",
                controller: _tanggalRencanaKembaliController,
                onTap: () {
                  _pilihTanggal(context, 'rencanaKembali');
                },
              ),
              Input(
                leading: "Tanggal Pengembalian",
                hint: "tanggal pengembalian",
                controller: _tanggalKembaliController,
                onTap: () {
                  _pilihTanggal(context, 'kembali');
                },
              ),
              Input(
                leading: "Pengguna",
                hint: 'pengguna',
                controller: _penggunaController,
              ),
              Input(
                leading: "No HP",
                hint: "no hp",
                controller: _noHpController,
              ),
              Input(
                leading: "Admin",
                hint: "admin",
                controller: _adminController,
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
                          ? _tambahData(
                              _noInventarisController.text,
                              _namaController.text,
                              _tipeController.text,
                              _kapasitasController.text,
                              _jumlahController.text,
                              _tanggalPeminjamanController.text,
                              _tanggalRencanaKembaliController.text,
                              _tanggalKembaliController.text,
                              _penggunaController.text,
                              _noHpController.text,
                              _adminController.text,
                              _keteranganController.text)
                          : ubahData(
                              _noInventarisController.text,
                              _namaController.text,
                              _tipeController.text,
                              _kapasitasController.text,
                              _jumlahController.text,
                              _tanggalPeminjamanController.text,
                              _tanggalRencanaKembaliController.text,
                              _tanggalKembaliController.text,
                              _penggunaController.text,
                              _noHpController.text,
                              _adminController.text,
                              _keteranganController.text);
                    }),
              )
            ],
    );
  }

  Future<Null> _pilihTanggal(BuildContext context, String jenisTanggal) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: tanggalPeminjaman,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != tanggalPeminjaman)
      setState(() {
        if (jenisTanggal == 'pinjam') {
          tanggalPeminjaman = picked;
          _tanggalPeminjamanController.text =
              tanggalPeminjaman.toString().split(' ')[0];
        } else if (jenisTanggal == 'rencanaKembali') {
          tanggalRencanaKembali = picked;
          _tanggalRencanaKembaliController.text =
              tanggalRencanaKembali.toString().split(' ')[0];
        } else if (jenisTanggal == 'kembali') {
          tanggalKembali = picked;
          _tanggalKembaliController.text =
              tanggalKembali.toString().split(' ')[0];
        }
      });
  }

  _tambahData(
      String noInventaris,
      String nama,
      String tipe,
      String kapasitas,
      String jumlah,
      String tanggalPinjam,
      String tanggalRencanaKembali,
      String tanggalKembali,
      String pengguna,
      String noHP,
      String admin,
      String keterangan) async {
    setState(() {
      _isLoading = true;
    });
    await collectionReference.add({
      "no_inventaris": noInventaris,
      "nama": nama,
      "tipe": tipe,
      "kapasitas": kapasitas,
      "jumlah": jumlah,
      "tanggal_pinjam": tanggalPinjam,
      "tanggal_rencana_kembali": tanggalRencanaKembali,
      "tanggal_kembali": tanggalKembali,
      "pengguna": pengguna,
      "no_hp": noHP,
      "admin": admin,
      "keterangan": keterangan
    }).then((value) {
      if (value.documentID != null) {
        setState(() {
          value.updateData({'id': value.documentID});
          _noInventarisController.clear();
          _namaController.clear();
          _tipeController.clear();
          _tanggalPeminjamanController.clear();
          _tanggalRencanaKembaliController.clear();
          _tanggalKembaliController.clear();
          _kapasitasController.clear();
          _adminController.clear();
          _noHpController.clear();
          _penggunaController.clear();
          _jumlahController.clear();
          _keteranganController.clear();
          _isLoading = false;
        });
        showAlert(
            tipe: 'berhasil',
            pesan: 'Berhasil menambah data baru peminjaman mesin');
      }
    }).timeout(Duration(seconds: 10), onTimeout: () {
      showAlert(
          tipe: 'gagal', pesan: "Gagal. Mohon periksa koneksi internet anda!");
      return;
    });
  }

  ubahData(
      String noInventaris,
      String nama,
      String tipe,
      String kapasitas,
      String jumlah,
      String tanggalPinjam,
      String tanggalRencanaKembali,
      String tanggalKembali,
      String pengguna,
      String noHP,
      String admin,
      String keterangan) async {
    setState(() {
      _isLoading = true;
    });
    await collectionReference.document(widget.peminjamanMesin.id).updateData({
      'no_inventaris': noInventaris,
      'nama': nama,
      'tipe': tipe,
      'kapasitas': kapasitas,
      'jumlah': jumlah,
      'tanggal_pinjam': tanggalPinjam,
      'tanggal_rencana_kembali': tanggalRencanaKembali,
      'tanggal_kembali': tanggalKembali,
      'pengguna': pengguna,
      'no_hp': noHP,
      'admin': admin,
      'keterangan': keterangan
    }).then((value) {
      setState(() {
        _noInventarisController.clear();
        _namaController.clear();
        _tipeController.clear();
        _kapasitasController.clear();
        _tanggalPeminjamanController.clear();
        _tanggalRencanaKembaliController.clear();
        _tanggalKembaliController.clear();
        _penggunaController.clear();
        _jumlahController.clear();
        _noHpController.clear();
        _adminController.clear();
        _keteranganController.clear();
        _isLoading = false;
      });
      showAlert(
          tipe: 'berhasil', pesan: 'Berhasil mengubah data peminjaman mesin');
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
