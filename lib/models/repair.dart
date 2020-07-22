import 'package:cloud_firestore/cloud_firestore.dart';

class Repair {
  String id;
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
      this.jenisMesin,
      this.nama,
      this.tanggalRusak,
      this.tanggalPerbaikan,
      this.consumable,
      this.pj,
      this.sparePart,
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
      json['jenis mesin'] as String,
      json['nama'] as String,
      json['tanggal rusak'] as String,
      json['tanggal perbaikan'] as String,
      json['consumable'] as String,
      json['spare part'] as String,
      json['pj'] as String,
      json['keterangan'] as String);
}

Map<dynamic, dynamic> _mesinToJson(Repair instance) => <String, dynamic>{
      'id': instance.id,
      'jenis mesin': instance.jenisMesin,
      'nama': instance.nama,
      'tanggal rusak': instance.tanggalRusak,
      'tanggal perbaikan': instance.tanggalPerbaikan,
      'consumable': instance.consumable,
      'spare part': instance.sparePart,
      'pj': instance.pj,
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
