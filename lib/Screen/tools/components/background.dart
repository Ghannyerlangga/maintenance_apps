import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final AppBar appBar;
  final Widget body;

  const Background({
    Key key,
    this.appBar,
    this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar,
      body: Container(
        padding: EdgeInsets.only(top: size.height * 0.03),
        height: size.height,
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.2,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        // color: Colors.white,
                        padding: EdgeInsets.fromLTRB(0, 10.0, 5.0, 0),
                        child: Image.asset(
                          "img/logo_wika1.png",
                          height: MediaQuery.of(context).size.height * 0.10,
                          width: MediaQuery.of(context).size.width * 0.40,
                        ),
                      ),
                      Container(
                        // color: Colors.white,
                        padding: EdgeInsets.fromLTRB(0, 10.0, 10.0, 0),
                        child: Image.asset(
                          "img/logo_industri.png",
                          height: MediaQuery.of(context).size.height * 0.10,
                          width: MediaQuery.of(context).size.width * 0.40,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        // color: Colors.white,
                        margin: EdgeInsets.only(top: 5.0, bottom: 20.0),
                        child: Text(
                          "Pabrik Fabrikasi Baja Majalengka",
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            body
          ],
        ),
      ),
    );
  }
}
