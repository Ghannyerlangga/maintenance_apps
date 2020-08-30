import 'package:cloud_firestore/cloud_firestore.dart';

class SparePart {
  String id;
  String nama;
  String tipe;
  String kapasitas;
  String tanggalDatang;
  String part;
  String jumlah;
  String keterangan;

  DocumentReference reference;

  SparePart(this.id, this.nama, this.tipe, this.kapasitas, this.tanggalDatang,
      this.part, this.jumlah, this.keterangan);

  factory SparePart.fromSnapshot(DocumentSnapshot snapshot) {
    SparePart sparePart = SparePart.fromJson(snapshot.data);
    sparePart.reference = snapshot.reference;
    return sparePart;
  }

  factory SparePart.fromJson(Map<dynamic, dynamic> json) =>
      _sparePartFromJson(json);

  Map<dynamic, dynamic> toJson() => _sparePartToJson(this);
}

SparePart _sparePartFromJson(Map<dynamic, dynamic> json) {
  return SparePart(
      json['id'] as String,
      json['nama'] as String,
      json['tipe'] as String,
      json['kapasitas'] as String,
      json['tanggal_datang'] as String,
      json['part_mesin'] as String,
      json['jumlah'] as String,
      json['keterangan'] as String);
}

Map<dynamic, dynamic> _sparePartToJson(SparePart instance) => <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
      'tipe': instance.tipe,
      'kapasitas': instance.kapasitas,
      'tanggal_datang': instance.tanggalDatang,
      'part_mesin': instance.part,
      'jumlah': instance.jumlah,
      'keterangan': instance.keterangan
    };
