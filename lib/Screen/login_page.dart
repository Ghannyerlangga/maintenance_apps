import 'package:flutter/material.dart';
import 'package:maintenance_apps/Services/auth_services.dart';
import 'package:maintenance_apps/shared/constant.dart';
import 'package:maintenance_apps/shared/loading.dart';

class LoginPage extends StatefulWidget {
  final Function toggleView;
  LoginPage({this.toggleView});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.blueAccent[100],
            appBar: AppBar(
              backgroundColor: Colors.blueAccent,
              title: Text(
                "Sign In to WIKA Maintenance".toUpperCase(),
                style: TextStyle(fontSize: 14.0),
              ),
              actions: <Widget>[
                FlatButton.icon(
                    onPressed: () {
                      widget.toggleView();
                    },
                    icon: Icon(Icons.person_add),
                    label: Text("Register"))
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: new ListView(children: <Widget>[
                Form(
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
                        RaisedButton(
                            color: Colors.lightBlueAccent,
                            child: Text("Sign In",
                                style: TextStyle(
                                    color: Colors.white38.withOpacity(0.8))),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                dynamic result =
                                    await _auth.signInWithEmailAndPassword(
                                        email, password);
                                if (result == null) {
                                  setState(() {
                                    error =
                                        'Login gagal! Email atau Password SALAH';
                                    loading = false;
                                  });
                                }
                              }
                            }),
                        SizedBox(height: 12.0),
                        Text(
                          error,
                          style:
                              TextStyle(color: Colors.red[300], fontSize: 14.0),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 5.0),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text("PT. WIKA Industri dan Konstruksi @2020",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14.0)),
                        )
                      ],
                    ))
              ]),
            ));
  }
}
