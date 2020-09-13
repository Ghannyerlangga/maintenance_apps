import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/laporan/harian.dart';
import 'package:maintenance_apps/Screen/tools/components/inputField.dart';
import 'package:maintenance_apps/Screen/tools/dialog.dart';
import 'package:maintenance_apps/models/mesin.dart';
import 'package:maintenance_apps/shared/constant.dart';
import 'package:maintenance_apps/shared/loading.dart';

class TambahMesin extends StatefulWidget {
  final String mode;
  final Mesin mesin;
  TambahMesin(this.mesin, this.mode);
  @override
  _TambahMesinState createState() => _TambahMesinState();
}

class _TambahMesinState extends State<TambahMesin> {
  double s;

  bool _isLoading = false;

  List listJenisMesin = ["AMG", "CORYMPEX", "FICEP"];
  List listKondisi = ["Baik", "Rusak"];
  String jenisMesin;
  String kondisiMesin;

  TextEditingController _namaController = TextEditingController();
  TextEditingController _jenisController = TextEditingController();
  TextEditingController _kapasitasController = TextEditingController();
  TextEditingController _jumlahController = TextEditingController();
  TextEditingController _lokasiController = TextEditingController();
  TextEditingController _keteranganController = TextEditingController();
  TextEditingController _kodeController = TextEditingController();
  TextEditingController _noInventarisController = TextEditingController();
  TextEditingController _tanggalDatangController = TextEditingController();

  bool _modeTambah = true;
  bool _kodeEnable = true;
  DateTime tanggalDatang = DateTime.now();

  @override
  void initState() {
    if (widget.mode != 'tambah') {
      _modeTambah = false;
      _kodeEnable = false;
      _namaController.text = widget.mesin.nama;
      _tanggalDatangController.text = widget.mesin.tahun_beli;
      _jenisController.text = widget.mesin.jenis;
      kondisiMesin = widget.mesin.kondisi;
      _noInventarisController.text = widget.mesin.no_inventaris;
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
    s = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: _modeTambah
            ? Text('Input Mesin Baru'.toUpperCase())
            : Text('Edit Data Mesin'.toUpperCase()),
      ),
      body: _isLoading
          ? Loading()
          : ListView(
              padding: EdgeInsets.fromLTRB(s * 0.1, 10, s * 0.1, 0),
              children: [
                // Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: InputDecorator(
                //       decoration: textInputDecoration.copyWith(
                //           hintText: "jenis mesin", labelText: "Jenis Mesin"),
                //       child: DropdownButton(
                //           isDense: true,
                //           hint: Text('jenis mesin'),
                //           value: jenisMesin,
                //           items: listJenisMesin.map((e) {
                //             return DropdownMenuItem(
                //               child: Text(e),
                //               value: e,
                //             );
                //           }).toList(),
                //           onChanged: (value) {
                //             setState(() {
                //               jenisMesin = value;
                //             });
                //           }),
                //     )),
                Input(
                  leading: "Jenis Mesin",
                  controller: _jenisController,
                  hint: "jenis mesin",
                ),
                Input(
                  leading: "Kode",
                  controller: _kodeController,
                  hint: "kode",
                  enable: _kodeEnable,
                ),

                inputField(
                    "No Inventaris", _noInventarisController, 'no inventaris'),
                inputField('Nama Mesin', _namaController, 'nama mesin'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: TextField(
                      controller: _tanggalDatangController,
                      decoration: textInputDecoration.copyWith(
                          labelText: "Tanggal Pembelian Mesin",
                          hintText: 'tanggal pembelian mesin'),
                      onTap: () {
                        _pilihTanggal(context);
                      },
                    ),
                  ),
                ),
                inputField('Kapasitas', _kapasitasController, 'kapasitas'),
                inputField('Jumlah', _jumlahController, 'jumlah'),
                inputField('Lokasi', _lokasiController, 'lokasi'),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InputDecorator(
                      decoration: textInputDecoration.copyWith(
                          hintText: "kondisi mesin",
                          labelText: "Kondisi Mesin"),
                      child: DropdownButton(
                          isDense: true,
                          hint: Text('kondisi mesin'),
                          value: kondisiMesin,
                          items: listKondisi.map((e) {
                            return DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              kondisiMesin = value;
                            });
                          }),
                    )),
                inputField('Keterangan', _keteranganController, 'keterangan'),
                Padding(
                  padding: EdgeInsets.fromLTRB(s * 0.2, 0, s * 0.2, 0),
                  child: RaisedButton(
                      color: Colors.blue[200],
                      child: Text('Simpan'),
                      onPressed: () {
                        _modeTambah ? tambahMesin() : editMesin();
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
      child:
          //  Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: <Widget>[
          //     Container(
          //         width: MediaQuery.of(context).size.width * 0.20,
          //         child: Text(
          //           leading,
          //           style: TextStyle(fontWeight: FontWeight.bold),
          //         )),
          //     Container(
          //       width: MediaQuery.of(context).size.width * 0.70,
          //       child: TextField(
          //         controller: controller,
          //         decoration: InputDecoration(hintText: hint),
          //       ),
          //     ),
          //   ],
          // ),
          TextField(
        controller: controller,
        decoration: textInputDecoration.copyWith(
          labelText: leading,
          hintText: hint,
        ),
      ),
    );
  }

  editMesin() async {
    setState(() {
      _isLoading = true;
    });
    String kode = _kodeController.text;
    String nama = _namaController.text;
    String noInventaris = _noInventarisController.text;
    String tanggalPembelian = _tanggalDatangController.text;
    String kondisi = kondisiMesin;
    String jenis = _jenisController.text;
    String kapasitas = _kapasitasController.text;
    String jumlah = _jumlahController.text;
    String lokasi = _lokasiController.text;
    String keterangan = _keteranganController.text;

    Mesin mesin = Mesin(nama, noInventaris, tanggalPembelian, kondisi, jenis,
        kode, kapasitas, jumlah, lokasi, keterangan);
    await Firestore.instance
        .collection('mesin')
        .document(widget.mesin.kode)
        .setData(mesin.toJson())
        .then((value) {
      print('berhasil mengubah data');
      setState(() {
        _kodeController.clear();
        _namaController.clear();
        _tanggalDatangController.clear();
        _kapasitasController.clear();
        _jenisController.clear();
        _kapasitasController.clear();
        _jumlahController.clear();
        _lokasiController.clear();
        _keteranganController.clear();
        _noInventarisController.clear();
        jenisMesin = null;
        kondisi = null;
        _isLoading = false;
      });
      showAlert(tipe: 'berhasil', pesan: 'Berhasil mengubah data mesin');
    }).timeout(Duration(seconds: 10), onTimeout: () {
      showAlert(
          tipe: 'gagal', pesan: 'Gagal. Mohon periksa koneksi internet anda');
      return;
    });
  }

  tambahMesin() async {
    setState(() {
      _isLoading = true;
    });
    String kode = _kodeController.text;
    String nama = _namaController.text;
    String noInventaris = _noInventarisController.text;
    String tanggalPembelian = _tanggalDatangController.text;
    String kondisi = _kodeController.text;
    String jenis = _jenisController.text;
    String kapasitas = _kapasitasController.text;
    String jumlah = _jumlahController.text;
    String lokasi = _lokasiController.text;
    String keterangan = _keteranganController.text;

    Mesin mesin = Mesin(nama, noInventaris, tanggalPembelian, kondisi, jenis,
        kode, kapasitas, jumlah, lokasi, keterangan);
    await Firestore.instance
        .collection('mesin')
        .document(kode)
        .setData(mesin.toJson())
        .then((value) {
      print('berhasil menyimpan data');
      setState(() {
        _kodeController.clear();
        _namaController.clear();
        _tanggalDatangController.clear();
        _noInventarisController.clear();
        _jenisController.clear();
        _kapasitasController.clear();
        _jumlahController.clear();
        _lokasiController.clear();
        _keteranganController.clear();
        jenisMesin = null;
        kondisi = null;
        _isLoading = false;
      });
      showAlert(tipe: 'berhasil', pesan: 'Berhasil meyimpan data mesin');
    }).timeout(Duration(seconds: 10), onTimeout: () {
      showAlert(
          tipe: 'gagal', pesan: 'Gagal. Mohon periksa koneksi internet anda');
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
}
