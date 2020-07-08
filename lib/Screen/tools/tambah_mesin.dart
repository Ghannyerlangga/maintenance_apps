import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/laporan/harian.dart';
import 'package:maintenance_apps/Screen/tools/list_mesin.dart';
import 'package:maintenance_apps/shared/loading.dart';

class TambahMesin extends StatefulWidget {
  @override
  _TambahMesinState createState() => _TambahMesinState();
}

class _TambahMesinState extends State<TambahMesin> {

  TextEditingController _namaController = TextEditingController();
  TextEditingController _jenisController = TextEditingController();
  TextEditingController _kapasitasController = TextEditingController();
  TextEditingController _jumlahController = TextEditingController();
  TextEditingController _lokasiController = TextEditingController();
  TextEditingController _keteranganController = TextEditingController();
  TextEditingController _kodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        title: Text('Input Mesin Baru'),

      ),
      body: ListView(
        children: [
          inputField('Kode', _kodeController, 'kode mesin'),
          inputField('Nama Mesin', _namaController, 'nama mesin'),
          inputField('Jenis Mesin', _jenisController, 'jenis mesin'),
          inputField('Kapasitas', _kapasitasController, 'kapasitas'),
          inputField('Jumlah', _jumlahController, 'jumlah'),
          inputField('Lokasi', _lokasiController, 'lokasi'),
          inputField('Keterangan', _keteranganController, 'keterangan'),
          RaisedButton(
            
            child: Text('Simpan'),
            onPressed: ()  {
              tambahMesin();
            })
        ],
      ),
    );
  }

  Widget inputField(String leading, TextEditingController controller, String hint){
   return Padding(
     padding: const EdgeInsets.all(8.0),
     child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: hint
                ),
              ),
   );
  }

  Future<Widget> tambahMesin()async{
              
              
              String kode = _kodeController.text;
              String nama = _namaController.text;
              String jenis = _jenisController.text;
              String kapasitas = _kapasitasController.text;
              String jumlah = _jumlahController.text;
              String lokasi = _lokasiController.text;
              String keterangan = _keteranganController.text;

              await database.addMesin(kode, nama, jenis, kapasitas, jumlah, lokasi, keterangan).then((value){
               
              }).whenComplete((){
                 _kodeController.clear();
                _namaController.clear();
                _jenisController.clear();
                _kapasitasController.clear();
                _jumlahController.clear();
                _lokasiController.clear();
                _keteranganController.clear();
                return Loading();
              });
             
  }
}