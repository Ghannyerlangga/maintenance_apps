import 'package:flutter/material.dart';

class ButtonMenu extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Function onPressed;
  final String image;
  final String text;
  const ButtonMenu(
      {Key key,
      this.padding,
      this.margin,
      this.onPressed,
      this.image,
      this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: margin,
      padding: padding,
      child: ButtonTheme(
          minWidth: size.width * 0.40,
          height: size.height * 0.20,
          child: FlatButton(
            color: Colors.lightBlueAccent[100],
            onPressed: onPressed,
            child: Column(
              children: <Widget>[
                Container(
                  height: size.height * 0.1,
                  child: Image.asset(
                    image,
                    height: size.height * 0.1,
                  ),
                  padding: EdgeInsets.all(10.0),
                ),
                Container(
                    child: Text(
                  text,
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
