import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/tools/components/tools_select.dart';
import 'package:maintenance_apps/Screen/tools/daftar_jenis_mesin.dart';
import 'package:maintenance_apps/Screen/tools/inOutList/in_out_list.dart';
import 'package:maintenance_apps/Screen/tools/lihat_repair.dart';
import 'package:maintenance_apps/Screen/tools/list_consumable.dart';
import 'package:maintenance_apps/Screen/tools/list_mesin.dart';
import 'package:maintenance_apps/Screen/tools/list_sparepart.dart';
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
              SizedBox(height: size.height * 0.03),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonMenu(
                        // margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (contex) {
                            return ListSparePart();
                          }));
                        },
                        image: "img/ConsumableIcon8.png",
                        text: "SPARE PART"),
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
                            return OutInList();
                          }));
                        },
                        image: "img/ConsumableIcon8.png",
                        text: "IN OUT LIST"),
                  ]),
            ],
          ),
        ]));
  }
}
