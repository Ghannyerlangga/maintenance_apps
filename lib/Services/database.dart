import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference myCollection =
      Firestore.instance.collection('data');
  final CollectionReference myChecklist = Firestore.instance.collection('checklist');
  final CollectionReference userCollection =
      Firestore.instance.collection('data');

  final CollectionReference mesinCollection =
      Firestore.instance.collection('mesin');

  final CollectionReference harianCollection =
      Firestore.instance.collection('harian');

  Future<void> updateUserData(
      String name, String position, String address) async {
    return await myCollection.document(uid).setData({
      'name': name,
      'position': position,
      'address': address,
    });
      }
    Future<DocumentSnapshot> getData(String uid) async {
      final snapshot = await userCollection.document(uid).get();
      return snapshot;
    }

    Future<QuerySnapshot> getMesin() {
      return mesinCollection.getDocuments();
    }

    Future<DocumentSnapshot> getDataHarian(String id) async {
      final snapshot = await harianCollection.document(id).get();
      return snapshot;
    }

    Future<void> addMesin(
        String kode,
        String nama,
        String jenis,
        String kapasitas,
        String jumlah,
        String lokasi,
        String keterangan) async {
      await mesinCollection.document(kode).setData({
        'kode': kode,
        'nama': nama,
        'jenis': jenis,
        'kapasitas': kapasitas,
        'jumlah': jumlah,
        'lokasi': lokasi,
        'keterangan': keterangan
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
      String checklist,
      String waktu,
    ) async {
      try {
        return await myChecklist.add({
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
          "checklist" :  checklist,
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
      String checklist,
      String waktu,
    ) async {
      try {
        return await myChecklist.add({
          "user": user,
          "rack": a,
          "gas hoses": b,
          "z-axis": c,
          "coolant": d,
          "clamp": e,
          "dust": f,
          "jenis mesin": jenis,
          "checklist" :  checklist,
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
      String checklist,
      String waktu,
    ) async {
      try {
        return await myChecklist.add({
          "user": user,
          "remote control": a,
          "machine angle": b,
          "jenis mesin": jenis,
          "checklist" :  checklist,
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
      String checklist,
      String waktu,
    ) async {
      try {
        return await myChecklist.add({
          "user": user,
          "tekanan angin": a,
          "tekanan angin cutflow": b,
          "filter udara": c,
          "level coolant": d,
          "jenis mesin": jenis,
          "checklist" :  checklist,
          "waktu": waktu,
        });
      } catch (e) {
        print(e.toString());
        return null;
      }
    }
  }
