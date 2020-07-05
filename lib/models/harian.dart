import 'package:cloud_firestore/cloud_firestore.dart';

class Harian{
  List<Data> data = List<Data>();

  Harian(this.data);

  DocumentReference reference;

  factory Harian.fromSnapshot(DocumentSnapshot snapshot){
    Harian newHarian = Harian.fromJson(snapshot.data);
    newHarian.reference = snapshot.reference;
    return newHarian;
  }

  factory Harian.fromJson(Map<dynamic,dynamic> json)=>
   _harianFromJson(json);

  Map<String,dynamic> toJson() => _harianToJson(this); 

}

Harian _harianFromJson(Map<dynamic,dynamic> json){
  return Harian(
    _convertDataAnak(json['data'] as List)
  );
}

Map<String,dynamic> _harianToJson(Harian instance){
  return {
    'data': _dataList(instance.data)
  };
}

List<Data> _convertDataAnak(List dataMap){
  if (dataMap == null){
    return null;
  }
  List<Data> data = List<Data>();
  dataMap.forEach((value){
    data.add(Data.fromJson(value));
  });
  return data;
}

List<Map<String,dynamic>> _dataList(List<Data> data){
  if (data == null){
    return null;
  }
  List<Map<String,dynamic>> dataMap =  List<Map<String,dynamic>>();
  data.forEach((dataAnak){
    dataMap.add(dataAnak.toJson());
  });
  return dataMap;
}




class Data {
    Data(
        this.keterangan,
        this.pengisi,
        this.waktu,
    );

    final String keterangan;
    final String pengisi;
    final String waktu;

    DocumentReference reference;

    factory Data.fromJson(Map<dynamic,dynamic> json)=>
    _dataFromJson(json);
  

  Map<String,dynamic> toJson()=>
    _dataToJson(this);

    

    
}

Data _dataFromJson(Map<dynamic, dynamic> json) => Data(
        json['keterangan'] as String,
        json['pengisi'] as String,
        json['waktu'] as String
    );

Map<String, dynamic> _dataToJson(Data instance) => {
        "keterangan": instance.keterangan,
        "pengisi": instance.pengisi,
        "waktu": instance.waktu,
    };