import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Services/database.dart';
import 'package:maintenance_apps/wrapper.dart';

class UserData extends StatefulWidget {
  @override
  _UserDataState createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  CollectionReference user = Firestore.instance.collection('data');

  TextEditingController _namaController = TextEditingController();
  TextEditingController _jabatanController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Wrapper();
                }));
              }),
          title: Text('Ubah Data Pengguna'),
        ),
        body: Container(
          child: FutureBuilder(
            future: getData(),
            builder: (_, pengguna) {
              return ListView(
                children: [

                  inputField('Nama Pengguna', _namaController, 'Pengguna'),
                  inputField('Jabatan', _jabatanController, 'Jabatan'),
                  inputField('Alamat', _addressController, 'Alamat'),
                  RaisedButton(
                      child: Text('Simpan'),
                      onPressed: () {
                        tambahUser();
                      })
                ],
              );
            },
          ),
        ));
  }

  void tambahUser() async {
    DatabaseService database = DatabaseService();

    String nama = _namaController.text;
    String jabatan = _jabatanController.text;
    String alamat = _addressController.text;

    await database.updateUserData(nama, jabatan, alamat).then((value) {
      _namaController.clear();
      _jabatanController.clear();
      _addressController.clear();
    });
  }

  Future getData() async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    DocumentSnapshot pengguna = await user.document(firebaseUser.uid).get();
                          _namaController.text = pengguna.data["name"];
                  _jabatanController.text = pengguna.data["position"];
                  _addressController.text = pengguna.data["address"];

    return pengguna.data;
  }

  Widget inputField(
      String leading, TextEditingController controller, String hint) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: hint),
      ),
    );
  }
}
