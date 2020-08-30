import 'package:flutter/material.dart';

class Selection extends StatelessWidget {
  final Function onPress;
  final Widget image;
  final String title;

  const Selection({
    Key key,
    this.image,
    this.onPress,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: ButtonTheme(
              minWidth: MediaQuery.of(context).size.width * 0.40,
              height: MediaQuery.of(context).size.height * 0.20,
              child: new FlatButton(
                padding: EdgeInsets.all(0),
                color: Colors.lightBlueAccent[100],
                onPressed: () {
                  onPress();
                },
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 50.0,
                      child: image,
                      padding: EdgeInsets.all(10.0),
                    ),
                    new Container(
                        child: Text(
                      title.toUpperCase(),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 10,
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
        ),
      ]),
    );
  }
}
