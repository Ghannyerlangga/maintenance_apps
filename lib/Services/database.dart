import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference myCollection = Firestore.instance.collection('data');
  
  Future<void> updateUserData(String name,String position,String address) async{
    return await myCollection.document(uid).setData({
      'name' : name,
      'position' : position,
      'address' : address,
    });
  }
}