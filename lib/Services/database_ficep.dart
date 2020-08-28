import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseFicep {
  final String uid;
  DatabaseFicep({this.uid});
  final CollectionReference myChecklist =
      Firestore.instance.collection("checklist");
  final CollectionReference myCollection =
      Firestore.instance.collection('data');

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
    String jam,
    String mesin,
    String dokumen,
  ) async {
    try {
      return await myChecklist
          .document(jenis + "-" + checklist + "-" + dokumen)
          .updateData({
        "user": user,
        "kerak rel": a,
        "sliding guides": b,
        "thermal cutting": c,
        "photocells": d,
        "reflektor": e,
        "proximity tranducers": f,
        "limit switches": g,
        "scraps plasma": h,
        "kerak plasma": i,
        "jenis mesin": jenis,
        "checklist": checklist,
        "waktu": waktu,
        "jam": jam,
        "mesin": mesin,
        "dokumen": dokumen,
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> createAddDaily(
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
    String jam,
    String mesin,
    String dokumen,
  ) async {
    try {
      return await myChecklist
          .document(jenis + "-" + checklist + "-" + dokumen)
          .setData({
        "user": user,
        "kerak rel": a,
        "sliding guides": b,
        "thermal cutting": c,
        "photocells": d,
        "reflektor": e,
        "proximity tranducers": f,
        "limit switches": g,
        "scraps plasma": h,
        "kerak plasma": i,
        "jenis mesin": jenis,
        "checklist": checklist,
        "waktu": waktu,
        "jam": jam,
        "mesin": mesin,
        "dokumen": dokumen,
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> createAddMonthly(
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
    String jam,
    String mesin,
    String dokumen,
  ) async {
    try {
      return await myChecklist
          .document(jenis + "-" + checklist + "-" + dokumen)
          .setData({
        "user": user,
        "gantry": a,
        "adjusments": b,
        "pelumas drill": c,
        "tightening kamera": d,
        "proximity": e,
        "limit switches": f,
        "konektor terminal": g,
        "pengencangan pipa": h,
        "keausan pipa": i,
        "jenis mesin": jenis,
        "checklist": checklist,
        "waktu": waktu,
        "jam": jam,
        "mesin": mesin,
        "dokumen": dokumen,
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
    bool g,
    bool h,
    bool i,
    String jenis,
    String checklist,
    String waktu,
    String jam,
    String mesin,
    String dokumen,
  ) async {
    try {
      return await myChecklist
          .document(jenis + "-" + checklist + "-" + dokumen)
          .updateData({
        "user": user,
        "gantry": a,
        "adjusments": b,
        "pelumas drill": c,
        "tightening kamera": d,
        "proximity": e,
        "limit switches": f,
        "konektor terminal": g,
        "pengencangan pipa": h,
        "keausan pipa": i,
        "jenis mesin": jenis,
        "checklist": checklist,
        "waktu": waktu,
        "jam": jam,
        "mesin": mesin,
        "dokumen": dokumen,
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> createAddAnnual(
    String user,
    bool a,
    bool b,
    bool c,
    String jenis,
    String checklist,
    String waktu,
    String jam,
    String mesin,
    String dokumen,
  ) async {
    try {
      return await myChecklist
          .document(jenis + "-" + checklist + "-" + dokumen)
          .setData({
        "user": user,
        "sistem pelumasan": a,
        "encoder baterai": b,
        "status karet": c,
        "jenis mesin": jenis,
        "checklist": checklist,
        "waktu": waktu,
        "jam": jam,
        "mesin": mesin,
        "dokumen": dokumen,
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
    bool c,
    String jenis,
    String checklist,
    String waktu,
    String jam,
    String mesin,
    String dokumen,
  ) async {
    try {
      return await myChecklist
          .document(jenis + "-" + checklist + "-" + dokumen)
          .updateData({
        "user": user,
        "sistem pelumasan": a,
        "encoder baterai": b,
        "status karet": c,
        "jenis mesin": jenis,
        "checklist": checklist,
        "waktu": waktu,
        "jam": jam,
        "mesin": mesin,
        "dokumen": dokumen,
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
