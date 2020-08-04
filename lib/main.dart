import 'package:flutter/material.dart';
import 'package:maintenance_apps/Services/auth_services.dart';
import 'package:provider/provider.dart';
import 'wrapper.dart';

void main() {
  runApp(Utama());
}

class Utama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.firebaseUserStream,
      child: MaterialApp(
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                textTheme: TextTheme(
              headline6: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )),
            scaffoldBackgroundColor: Colors.blue[100]),
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
