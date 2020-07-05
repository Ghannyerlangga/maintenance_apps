import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference myCollection =
      Firestore.instance.collection('data');
  final CollectionReference myDaily = Firestore.instance.collection('daily');
  final CollectionReference myMonthly = Firestore.instance.collection('monthly');
  final CollectionReference myAnnual = Firestore.instance.collection('annual');
  final CollectionReference myPlasma = Firestore.instance.collection('plasma');

  Future<void> updateUserData(
      String name, String position, String address) async {
    return await myCollection.document(uid).setData({
      'name': name,
      'position': position,
      'address': address,
    });
  }

  Future<void> createUpdateDaily(
    String user,
    bool a,
    bool b,
    bool c,
    bool d,
    bool e,
    bool f,
    bool g,
    bool h,
    bool i,
    String jenis,
    String waktu,
  ) async {
    try {
      return await myDaily.add({
        "user": user,
        "rail": a,
        "machine": b,
        "limit switch": c,
        "linear guide": d,
        "cable chain": e,
        "nozzle": f,
        "oxygen": g,
        "elpiji": h,
        "nitrogen": i,
        "jenis mesin": jenis,
        "waktu": waktu,
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  Future<void> createUpdateMonthly(
    String user,
    bool a,
    bool b,
    bool c,
    bool d,
    bool e,
    bool f,
    String jenis,
    String waktu,
  ) async {
    try {
      return await myMonthly.add({
        "user": user,
        "rack": a,
        "gas hoses": b,
        "z-axis": c,
        "coolant": d,
        "clamp": e,
        "dust": f,
        "jenis mesin": jenis,
        "waktu": waktu,
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  Future<void> createUpdateAnnual(
    String user,
    bool a,
    bool b,
    String jenis,
    String waktu,
  ) async {
    try {
      return await myAnnual.add({
        "user": user,
        "remote control": a,
        "machine angle": b,
        "jenis mesin": jenis,
        "waktu": waktu,
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  Future<void> createUpdatePlasma(
    String user,
    bool a,
    bool b,
    bool c,
    bool d,
    String jenis,
    String waktu,
  ) async {
    try {
      return await myPlasma.add({
        "user": user,
        "tekanan angin": a,
        "tekanan angin cutflow": b,
        "filter udara" : c,
        "level coolant" : d,
        "jenis mesin": jenis,
        "waktu": waktu,
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
