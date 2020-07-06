import 'package:cloud_firestore/cloud_firestore.dart';



class Mesin {
    String nama;
    String jenis;
    String kode;
    String kapasitas;
    String jumlah;
    String lokasi;
    String keterangan;

    DocumentReference refernce;

    Mesin(this.nama,this.jenis,this.kode,this.kapasitas,this.jumlah,this.lokasi,this.keterangan);

    factory Mesin.fromSnapshot(DocumentSnapshot snapshot){
      Mesin newMesin = Mesin.fromJson(snapshot.data);
      newMesin.refernce = snapshot.reference;
      return newMesin;
    }

    factory Mesin.fromJson(Map<dynamic,dynamic> json) => _mesinFromJson(json);

    Map<dynamic, dynamic> toJson() => _mesinToJson(this);
}

Mesin _mesinFromJson(Map<dynamic,dynamic> json){
  return Mesin(
    json['nama'] as String,
    json['jenis'] as String,
    json['kode'] as String,
    json['kapasitas'] as String,
    json['jumlah'] as String,
    json['lokasi'] as String,
    json['keterangan'] as String
  );
}

Map<dynamic,dynamic> _mesinToJson(Mesin instance) => <String, dynamic>{
  'nama' : instance.nama,
  'jenis' : instance.jenis,
  'kode' : instance.kode,
  'keterangan' : instance.keterangan,
  'jumlah' : instance.jumlah,
  'lokasi' : instance.lokasi,
  'keterangan' : instance.keterangan
};
