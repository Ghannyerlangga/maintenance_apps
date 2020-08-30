import 'package:cloud_firestore/cloud_firestore.dart';

class PeminjamanMesin {
  String id;
  String noInventaris;
  String nama;
  String tipe;
  String kapasitas;
  String jumlah;
  String tanggalPinjam;
  String tanggalRencanaKembali;
  String tanggalKembali;
  String pengguna;
  String noHP;
  String admin;
  String keterangan;

  DocumentReference refernce;

  PeminjamanMesin(
      this.id,
      this.noInventaris,
      this.nama,
      this.tipe,
      this.kapasitas,
      this.jumlah,
      this.tanggalPinjam,
      this.tanggalRencanaKembali,
      this.tanggalKembali,
      this.pengguna,
      this.noHP,
      this.admin,
      this.keterangan);

  factory PeminjamanMesin.fromSnapshot(DocumentSnapshot snapshot) {
    PeminjamanMesin newMesin = PeminjamanMesin.fromJson(snapshot.data);
    newMesin.refernce = snapshot.reference;
    return newMesin;
  }

  factory PeminjamanMesin.fromJson(Map<dynamic, dynamic> json) =>
      _mesinFromJson(json);

  Map<dynamic, dynamic> toJson() => _mesinToJson(this);
}

PeminjamanMesin _mesinFromJson(Map<dynamic, dynamic> json) {
  return PeminjamanMesin(
      json['id'] as String,
      json['no_inventaris'] as String,
      json['nama'] as String,
      json['tipe'] as String,
      json['kapasitas'] as String,
      json['jumlah'] as String,
      json['tanggal_pinjam'] as String,
      json['tanggal_rencana_kembali'] as String,
      json['tanggal_kembali'] as String,
      json['pengguna'] as String,
      json['no_hp'] as String,
      json['admin'] as String,
      json['keterangan'] as String);
}

Map<dynamic, dynamic> _mesinToJson(PeminjamanMesin instance) =>
    <String, dynamic>{
      'id': instance.id,
      'no_inventaris': instance.noInventaris,
      'nama': instance.nama,
      'tipe': instance.tipe,
      'kapasitas': instance.kapasitas,
      'jumlah': instance.jumlah,
      'tanggal_pinjam': instance.tanggalPinjam,
      'tanggal_rencana_kembali': instance.tanggalRencanaKembali,
      'tanggal_kembali': instance.tanggalKembali,
      'pengguna': instance.pengguna,
      'no_hp': instance.noHP,
      'admin': instance.admin,
      'keterangan': instance.keterangan
    };
