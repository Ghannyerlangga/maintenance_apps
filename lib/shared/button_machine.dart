import 'package:flutter/material.dart';

class ButtonMachine extends StatelessWidget {
  const ButtonMachine({
    Key key,
    @required this.type,
    @required this.onPressed,
  }) : super(key: key);

  final String type;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: ButtonTheme(
          minWidth: size.width * 0.40,
          height: size.height * 0.10,
          child: new FlatButton(
            padding: EdgeInsets.all(0),
            color: Colors.lightBlueAccent[100],
            onPressed: onPressed,
            child: Column(
              children: <Widget>[
                Container(
                    child: Text(
                  type,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: size.height * 0.02,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                            color: Colors.lightBlue,
                            offset: Offset(1, 2),
                            blurRadius: 2)
                      ]),
                )),
              ],
            ),
          )),
    );
  }
}
