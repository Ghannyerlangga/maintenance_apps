import 'package:cloud_firestore/cloud_firestore.dart';

class Repair {
  String id;
  String noInventaris;
  String jumlah;
  String lokasi;
  String jenisMesin;
  String nama;
  String tanggalRusak;
  String tanggalPerbaikan;
  String consumable;
  String pj;
  String sparePart;
  String keterangan;

  DocumentReference refernce;

  Repair(
      this.id,
      this.noInventaris,
      this.jenisMesin,
      this.nama,
      this.tanggalRusak,
      this.tanggalPerbaikan,
      this.consumable,
      this.jumlah,
      this.pj,
      this.sparePart,
      this.lokasi,
      this.keterangan);

  factory Repair.fromSnapshot(DocumentSnapshot snapshot) {
    Repair newMesin = Repair.fromJson(snapshot.data);
    newMesin.refernce = snapshot.reference;
    return newMesin;
  }

  factory Repair.fromJson(Map<dynamic, dynamic> json) => _mesinFromJson(json);

  Map<dynamic, dynamic> toJson() => _mesinToJson(this);
}

Repair _mesinFromJson(Map<dynamic, dynamic> json) {
  return Repair(
      json['id'] as String,
      json['no_inventaris'] as String,
      json['jenis mesin'] as String,
      json['nama'] as String,
      json['tanggal rusak'] as String,
      json['tanggal perbaikan'] as String,
      json['consumable'] as String,
      json['jumlah'] as String,
      json['spare part'] as String,
      json['teknisi'] as String,
      json['lokasi'] as String,
      json['keterangan'] as String);
}

Map<dynamic, dynamic> _mesinToJson(Repair instance) => <String, dynamic>{
      'id': instance.id,
      'jenis mesin': instance.jenisMesin,
      'no_inventaris': instance.noInventaris,
      'nama': instance.nama,
      'tanggal rusak': instance.tanggalRusak,
      'tanggal perbaikan': instance.tanggalPerbaikan,
      'consumable': instance.consumable,
      'jumlah': instance.jumlah,
      'spare part': instance.sparePart,
      'pj': instance.pj,
      'lokasi': instance.lokasi,
      'keterangan': instance.keterangan
    };

List<Repair> convertDataMesin(List dataMap) {
  if (dataMap == null) {
    return null;
  }
  List<Repair> data = List<Repair>();
  dataMap.forEach((value) {
    data.add(Repair.fromJson(value));
  });
  return data;
}
