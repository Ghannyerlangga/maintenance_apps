import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/tools/components/tools_select.dart';
import 'package:maintenance_apps/Screen/tools/daftar_jenis_mesin.dart';
import 'package:maintenance_apps/Screen/tools/inOutList/in_out_list.dart';
import 'package:maintenance_apps/Screen/tools/lihat_repair.dart';
import 'package:maintenance_apps/Screen/tools/list_consumable.dart';
import 'package:maintenance_apps/Screen/tools/list_mesin.dart';
import 'package:maintenance_apps/Screen/tools/list_sparepart.dart';

class Tools extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Tools".toUpperCase(),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.blue[100],
        body: ListView(
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
                          return ListMesin();
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
                          return ShowRepair();
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
            Selection(
              title: "Spare Part",
              image: Image.asset(
                "img/ConsumableIcon8.png",
                width: 40,
                height: 40,
              ),
              onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ListSparePart();
                }));
              },
            ),
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
                          return ListConsumable();
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
            Selection(
              title: "In and Out List",
              image: Image.asset(
                "img/ToolIcon8.png",
                width: 40,
                height: 40,
              ),
              onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return OutInList();
                }));
              },
            )
          ],
        ));
  }
}
