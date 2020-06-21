import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/Checklist/daily.dart';
import 'package:maintenance_apps/Screen/Checklist/monthly.dart';
import 'package:maintenance_apps/Screen/Checklist/weekly.dart';

class Maintenance extends StatefulWidget {
  static const String routeName = "/maintenance";
  @override
  MaintenanceState createState() => new MaintenanceState();
}

class MaintenanceState extends State<Maintenance> {
  String foos = 'One';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      initialRoute: '/',
      routes: {
        Daily.routeName : (context) => Daily(),
        Weekly.routeName : (context) => Weekly(),
        Monthly.routeName : (context) => Monthly(),
      },
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('ExpansionTile'),
        ),
        body: Container(
          child: new ExpansionTile(
              title: new Text('Daftar Mesin'),
              backgroundColor: Theme.of(context).accentColor.withOpacity(0.025),
              children: <Widget>[
                new ListTile(
                  title: const Text('AMG'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildAboutDialog(context),
                    );
                  },
                ),
                new ListTile(
                  title: const Text('FICEP'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildAboutDialog(context),
                    );
                  },
                ),
                new ListTile(
                  title: const Text('DAITO'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildAboutDialog(context),
                    );
                  },
                ),
                new ListTile(
                  title: const Text('CORYMEX'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildAboutDialog(context),
                    );
                  },
                ),
              ]),
        ),
      ),
    );
  }

  Widget _buildAboutDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Pilih Checklist'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.start,
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Daily();
            }));
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Daily'),
        ),
        new FlatButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, Daily.routeName);
            // Navigator.pop(context);
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return Weekly();
            // }));
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Weekly'),
        ),
        new FlatButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Monthly();
            }));
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Monthly'),
        ),
      ],
    );
  }
}
