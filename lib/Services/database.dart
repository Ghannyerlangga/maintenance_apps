import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection = Firestore.instance.collection('data');

  final CollectionReference mesinCollection = Firestore.instance.collection('mesin');

  final CollectionReference harianCollection = Firestore.instance.collection('harian');

  Future<DocumentSnapshot> getData(String uid) async {
    final snapshot = await userCollection.document(uid).get();
    return snapshot;
  }

  Future<QuerySnapshot> getMesin(){
    return mesinCollection.getDocuments();
  }
  
  Future<DocumentSnapshot> getDataHarian(String id)async{
    final snapshot = await harianCollection.document(id).get();
    return snapshot;
  }

  Future<void> updateUserData(String name,String position,String address) async{
    return await userCollection.document(uid).setData({
      'name' : name,
      'position' : position,
      'address' : address,
    });
  }
}