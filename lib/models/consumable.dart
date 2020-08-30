import 'package:cloud_firestore/cloud_firestore.dart';

class Consumable {
  String id;
  String nama;
  String tanggalDatang;
  String kapasitas;
  String jenis;
  String part;
  String jumlah;
  String keterangan;

  DocumentReference reference;

  Consumable(this.id, this.nama, this.jenis, this.part, this.tanggalDatang,
      this.kapasitas, this.jumlah, this.keterangan);

  factory Consumable.fromSnapshot(DocumentSnapshot snapshot) {
    Consumable consumable = Consumable.fromJson(snapshot.data);
    consumable.reference = snapshot.reference;
    return consumable;
  }

  factory Consumable.fromJson(Map<dynamic, dynamic> json) =>
      _consumableFromJson(json);
  Map<dynamic, dynamic> toJson() => _consumableToJson(this);
}

Consumable _consumableFromJson(Map<dynamic, dynamic> json) {
  return Consumable(
      json['id'] as String,
      json['nama'] as String,
      json['jenis'] as String,
      json['part'] as String,
      json['tanggal_datang'] as String,
      json['kapasitas'] as String,
      json['jumlah'] as String,
      json['keterangan'] as String);
}

Map<dynamic, dynamic> _consumableToJson(Consumable instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
      'jenis': instance.jenis,
      'tanggal_datang': instance.tanggalDatang,
      'kapasitas': instance.kapasitas,
      'part': instance.part,
      'jumlah': instance.jumlah,
      'keterangan': instance.keterangan
    };
