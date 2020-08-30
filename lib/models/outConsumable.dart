import 'package:cloud_firestore/cloud_firestore.dart';

class OutConsumable {
  String id;
  String nama;
  String tipe;
  String kapasitas;
  String jumlah;
  String part;
  String tanggal;
  String teknisi;
  String admin;
  String keterangan;

  DocumentReference reference;

  OutConsumable(
      {this.id,
      this.admin,
      this.jumlah,
      this.kapasitas,
      this.keterangan,
      this.nama,
      this.part,
      this.tanggal,
      this.teknisi,
      this.tipe});

  factory OutConsumable.fromSnapshot(DocumentSnapshot snapshot) {
    OutConsumable outConsumable = OutConsumable.fromJson(snapshot.data);
    outConsumable.reference = snapshot.reference;
    return outConsumable;
  }

  factory OutConsumable.fromJson(Map<dynamic, dynamic> json) =>
      _outSparePartFromJson(json);

  Map<dynamic, dynamic> toJson() => _outSparePartToJson(this);
}

OutConsumable _outSparePartFromJson(Map<dynamic, dynamic> json) {
  return OutConsumable(
      id: json['id'] as String,
      nama: json['nama'] as String,
      tipe: json['tipe'] as String,
      kapasitas: json['kapasitas'] as String,
      jumlah: json['jumlah'] as String,
      part: json['part'] as String,
      tanggal: json['tanggal'] as String,
      teknisi: json['teknisi'] as String,
      admin: json['admin'] as String,
      keterangan: json['keterangan'] as String);
}

Map<dynamic, dynamic> _outSparePartToJson(OutConsumable instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
      'tipe': instance.tipe,
      'kapasitas': instance.kapasitas,
      'jumlah': instance.jumlah,
      'part': instance.part,
      'tanggal': instance.tanggal,
      'teknisi': instance.teknisi,
      'admin': instance.admin,
      'keterangan': instance.keterangan
    };
