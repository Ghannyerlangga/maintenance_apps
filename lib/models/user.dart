import 'package:cloud_firestore/cloud_firestore.dart';

class User {

  final String uid;
  final String nama;
  final String position;

  User(this.uid,this.nama,this.position);

  DocumentReference reference;

  factory User.fromSnapshot(DocumentSnapshot snapshot){
    User newUser = User.fromJson(snapshot.data);
    newUser.reference = snapshot.reference;
    return newUser;
  }

  factory User.fromJson(Map<dynamic,dynamic> json) =>
   _userFromJson(json);

}

User _userFromJson(Map<dynamic,dynamic> json){
  return User(
    json['id'] as String,
    json['nama'] as String,
    json['position'] as String
  );
}