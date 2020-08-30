import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maintenance_apps/models/outSparePart.dart';

class Database {
  OutSparePart _outSparePart;

  final CollectionReference outSparePartCollection =
      Firestore.instance.collection('outsparepart');

  final CollectionReference outConsumableCollection =
      Firestore.instance.collection('outconsumable');

  deleteOutSparePart(String docId) async {
    await outSparePartCollection.document(docId).delete();
  }

  Stream<QuerySnapshot> getOutSparePart() {
    return outSparePartCollection.snapshots();
  }

  deleteOutConsumable(String docId) async {
    await outConsumableCollection.document(docId).delete();
  }

  Stream<QuerySnapshot> getOutConsumable() {
    return outConsumableCollection.snapshots();
  }

  tambahData(OutSparePart outSparePart) async {
    _outSparePart = outSparePart;
    await outSparePartCollection.add(_outSparePart.toJson());
  }

  ubahData(OutSparePart outSparePart) async {
    _outSparePart = outSparePart;
    await outSparePartCollection
        .document(outSparePart.id)
        .updateData(_outSparePart.toJson());
  }
}
