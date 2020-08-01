import 'package:cloud_firestore/cloud_firestore.dart';

class DaftarMesin {
  List<Mesin> listMesin = List<Mesin>();

  DaftarMesin(this.listMesin);

  DocumentReference reference;

  // factory DaftarMesin.fromSnapshot(DocumentSnapshot snapshot){
  //     DaftarMesin newMesin = DaftarMesin.fromJson(snapshot.data);
  //     newMesin.reference = snapshot.reference;
  //     return newMesin;
  //   }

  factory DaftarMesin.fromJson(List<DocumentSnapshot> json) =>
      _listMesinFromJson(json);
}

DaftarMesin _listMesinFromJson(List<DocumentSnapshot> json) {
  return DaftarMesin(_convertDataMesin(json));
}

List<Mesin> _convertDataMesin(List<DocumentSnapshot> dataMap) {
  if (dataMap == null) {
    return null;
  }
  List<Mesin> data = List<Mesin>();
  dataMap.forEach((element) {
    data.add(Mesin.fromJson(element.data));
  });
  return data;
}

class Mesin {
  String nama;
  String jenis;
  String kode;
  String kapasitas;
  String jumlah;
  String lokasi;
  String keterangan;

  DocumentReference refernce;

  Mesin(this.nama, this.jenis, this.kode, this.kapasitas, this.jumlah,
      this.lokasi, this.keterangan);

  factory Mesin.fromSnapshot(DocumentSnapshot snapshot) {
    Mesin newMesin = Mesin.fromJson(snapshot.data);
    newMesin.refernce = snapshot.reference;
    return newMesin;
  }

  factory Mesin.fromJson(Map<dynamic, dynamic> json) => _mesinFromJson(json);

  Map<dynamic, dynamic> toJson() => _mesinToJson(this);
}

Mesin _mesinFromJson(Map<dynamic, dynamic> json) {
  return Mesin(
      json['nama'] as String,
      json['jenis'] as String,
      json['kode'] as String,
      json['kapasitas'] as String,
      json['jumlah'] as String,
      json['lokasi'] as String,
      json['keterangan'] as String);
}

Map<dynamic, dynamic> _mesinToJson(Mesin instance) => <String, dynamic>{
      'nama': instance.nama,
      'jenis': instance.jenis,
      'kode': instance.kode,
      'kapasitas': instance.kapasitas,
      'jumlah': instance.jumlah,
      'lokasi': instance.lokasi,
      'keterangan': instance.keterangan
    };

List<Mesin> convertDataMesin(List dataMap) {
  if (dataMap == null) {
    return null;
  }
  List<Mesin> data = List<Mesin>();
  dataMap.forEach((value) {
    data.add(Mesin.fromJson(value));
  });
  return data;
}
