import 'package:flutter/material.dart';
import 'package:maintenance_apps/shared/loading.dart';

class Form extends StatelessWidget {
  final List<Widget> formField;
  final String appBarTitle;

  const Form({
    Key key,
    this.appBarTitle,
    this.formField,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(appBarTitle.toUpperCase()),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(s.width * 0.1, 10, s.width * 0.1, 0),
        children: formField,
      ),
    );
  }
}
