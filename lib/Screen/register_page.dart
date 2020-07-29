import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_apps/Services/auth_services.dart';
import 'package:maintenance_apps/Services/database.dart';
import 'package:maintenance_apps/shared/constant.dart';
import 'package:maintenance_apps/shared/loading.dart';

class RegisterPage extends StatefulWidget {
  final Function toggleView;
  RegisterPage({this.toggleView});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthServices _auth = AuthServices();
  final DatabaseService db = DatabaseService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  CollectionReference myCollection = Firestore.instance.collection('data');

  String email = '';
  String password = '';
  String nama = '';
  String alamat = '';
  String error = '';
  String position = 'Employee';
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.blueAccent[100],
            appBar: AppBar(
              backgroundColor: Colors.blueAccent,
              title: Text("Register WIKA Maintenance",
                  style: TextStyle(fontSize: 16.0)),
              actions: <Widget>[
                FlatButton.icon(
                    onPressed: () {
                      widget.toggleView();
                    },
                    icon: Icon(Icons.person),
                    label: Text("Sign In"))
              ],
            ),
            body: ListView(children: <Widget>[
              Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            "img/logo_industri.png",
                            height: 120,
                            width: 250,
                          ),
                          Container(
                            child: Text(
                              "Pabrik Fabrikasi Baja Majalengka",
                              style: TextStyle(
                                  color: Colors.blue[900],
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                              decoration: textInputDecoration.copyWith(
                                hintText: "Email",
                              ),
                              validator: (val) =>
                                  val.isEmpty ? 'Enter an Email' : null,
                              onChanged: (val) {
                                setState(() => email = val);
                              }),
                          SizedBox(height: 20.0),
                          TextFormField(
                              obscureText: true,
                              decoration: textInputDecoration.copyWith(
                                hintText: "Password",
                              ),
                              validator: (val) => val.length < 6
                                  ? 'Enter a Password 6+ chars long'
                                  : null,
                              onChanged: (val) {
                                setState(() => password = val);
                              }),
                          SizedBox(height: 20.0),
                          TextFormField(
                              decoration: textInputDecoration.copyWith(
                                hintText: "Nama",
                              ),
                              validator: (val) =>
                                  val.isEmpty ? 'Masukkan Nama' : null,
                              onChanged: (val) {
                                setState(() => nama = val);
                              }),
                          SizedBox(height: 20.0),
                          TextFormField(
                              decoration: textInputDecoration.copyWith(
                                hintText: "Alamat",
                              ),
                              validator: (val) =>
                                  val.isEmpty ? 'Masukkan Alamat' : null,
                              onChanged: (val) {
                                setState(() => alamat = val);
                              }),
                          SizedBox(height: 20.0),
                          RaisedButton(
                              color: Colors.lightBlueAccent,
                              child: Text("Register",
                                  style: TextStyle(
                                      color: Colors.white38.withOpacity(0.8))),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() => loading = true);
                                  dynamic result =
                                      await _auth.registerWithEmailAndPassword(
                                          email, password, nama, alamat);
                                  if (result == null) {
                                    setState(() {
                                      loading = false;
                                      error = 'Masukkan Email Yang Valid';
                                    });
                                  }
                                }
                              }),
                          SizedBox(height: 12.0),
                          Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 14.0),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 5.0),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                                "PT. WIKA Industri dan Konstruksi @2020",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14.0)),
                          )
                        ],
                      ))),
            ]),
          );
  }
}
