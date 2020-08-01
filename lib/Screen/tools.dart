import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/tools/daftar_jenis_mesin.dart';

class Tools extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Tools",
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.blue[100],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Expanded(
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width * 0.40,
                    height: MediaQuery.of(context).size.height * 0.20,
                    child: new FlatButton(
                      padding: EdgeInsets.all(0),
                      color: Colors.lightBlueAccent[100],
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (contex) {
                          return DaftarMesin('mesin');
                        }));
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 50.0,
                            child: Image.asset(
                              "img/MachineFlatIcon.png",
                              height: 40.0,
                              width: 40.0,
                            ),
                            padding: EdgeInsets.all(10.0),
                          ),
                          new Container(
                              child: Text(
                            "LIST MACHINE",
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
            // ),
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
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (contex) {
                          return DaftarMesin('repair');
                        }));
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 50.0,
                            child: Image.asset(
                              "img/repairFlatIcon.png",
                              height: 40.0,
                              width: 40.0,
                            ),
                            padding: EdgeInsets.all(10.0),
                          ),
                          new Container(
                              child: Text(
                            "REPAIR",
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
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (contex) {
                          return DaftarMesin('consumable');
                        }));
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 50.0,
                            child: Image.asset(
                              "img/ConsumableIcon8.png",
                              height: 40.0,
                              width: 40.0,
                            ),
                            padding: EdgeInsets.all(10.0),
                          ),
                          new Container(
                              child: Text(
                            "CONSUMABLE",
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
          ],
        ));
  }
}
