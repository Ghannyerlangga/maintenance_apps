import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/Checklist/amg/annual.dart';
import 'package:maintenance_apps/Screen/Checklist/amg/daily.dart';
import 'package:maintenance_apps/Screen/Checklist/amg/monthly.dart';
import 'package:maintenance_apps/Screen/Checklist/amg/plasma.dart';

class DaitoDialog extends StatefulWidget {
  final String value;
  final String hasil;
  DaitoDialog({this.value, this.hasil});
  @override
  _DaitoDialogState createState() => _DaitoDialogState();
}

class _DaitoDialogState extends State<DaitoDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      "DAITO",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120.0,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Daily(
                                  value: widget.value, hasil: widget.hasil),
                            ));
                      },
                      child: Text(
                        "Daily",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: const Color(0xFF1BC0C5),
                    ),
                  ),
                  SizedBox(
                    width: 120.0,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Monthly(
                                  value: widget.value, hasil: widget.hasil),
                            ));
                      },
                      child: Text(
                        "Monthly",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: const Color(0xFF1BC0C5),
                    ),
                  ),
                  SizedBox(
                    width: 120.0,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Annual(
                                  value: widget.value, hasil: widget.hasil),
                            ));
                      },
                      child: Text(
                        "Semi-Annual",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: const Color(0xFF1BC0C5),
                    ),
                  ),
                  Container(
                    child: Text(
                      "DAITO",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120.0,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Plasma(
                                  value: widget.value, hasil: widget.hasil),
                            ));
                      },
                      child: Text(
                        "Daily",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: const Color(0xFF1BC0C5),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
