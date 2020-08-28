import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/tools/lihat_repair.dart';
import 'package:maintenance_apps/Screen/tools/list_consumable.dart';
import 'package:maintenance_apps/Screen/tools/list_mesin.dart';
import 'package:maintenance_apps/shared/button_menu.dart';

class Tools extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Tools".toUpperCase(),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.blue[100],
        body: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.1),
              // Expanded(
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonMenu(
                      // margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (contex) {
                          return ListMesin();
                        }));
                      },
                      image: "img/MachineFlatIcon.png",
                      text: "LIST MACHINE",
                    ),
                  ]),
              // ),
              SizedBox(height: size.height * 0.03),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonMenu(
                      // margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (contex) {
                          return ShowRepair();
                        }));
                      },
                      image: "img/repairFlatIcon.png",
                      text: "REPAIR",
                    ),
                  ]),
              SizedBox(height: size.height * 0.03),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonMenu(
                        // margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (contex) {
                            return ListConsumable();
                          }));
                        },
                        image: "img/ConsumableIcon8.png",
                        text: "CONSUMABLE"),
                  ]),
            ],
          ),
        ]));
  }
}
