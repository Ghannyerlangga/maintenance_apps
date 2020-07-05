import 'package:cloud_firestore/cloud_firestore.dart';



class Mesin {
    String nama;
    String jenis;
    String kode;

    DocumentReference refernce;

    Mesin(this.jenis,this.kode,this.nama);

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
  );
}

Map<dynamic,dynamic> _mesinToJson(Mesin instance) => <String, dynamic>{
  'nama' : instance.nama,
  'jenis' : instance.jenis,
  'kode' : instance.kode
};
