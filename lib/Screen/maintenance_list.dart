import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/List_Mesin/amg_list.dart';
import 'package:maintenance_apps/Screen/List_Mesin/corympex_list.dart';
import 'package:maintenance_apps/Screen/List_Mesin/ficep_llist.dart';
import 'package:maintenance_apps/shared/button_machine.dart';
import 'package:maintenance_apps/shared/dialog.dart';

class MainList extends StatefulWidget {
  @override
  _MainListState createState() => _MainListState();
}

class _MainListState extends State<MainList> {
  final String amg = "AMG";
  final String corympex = "CORYMPEX";
  final String ficep = "FICEP";
  final String daito = "DAITO";
  final String compressor = "COMPRESSOR";
  final String dryer = "DRYER";
  final String rollprof1 = "ROLL PROFILE DAVI 1";
  final String rollprof2 = "ROLL PROFILE DAVI 2";
  final String rollplat = "ROLL PLATE DAVI";
  final String tayor = "TAYOR";
  final String radial = "RADIAL";
  final String geka = "GEKA";
  final String stamping = "STAMPING";
  final String welding = "WELDING MANIPULATOR";
  final String bandsaw = "BANDSAW VERNET 430";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Mesin".toUpperCase()),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back, // add custom icons also
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.blue[100],
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonMachine(
                      type: amg,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AmgList(
                                      mesin: amg,
                                    )));
                      },
                    ),
                    ButtonMachine(
                      type: ficep,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FicepList(
                                      mesin: ficep,
                                    )));
                      },
                    )
                  ]),
              // ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonMachine(
                      type: corympex,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CorympexList(
                                      mesin: corympex,
                                    )));
                      },
                    ),
                    ButtonMachine(
                      type: daito,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => Dialogku(
                                  mesin: daito,
                                ));
                      },
                    )
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonMachine(
                      type: compressor,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => Dialogku(
                                  mesin: compressor,
                                ));
                      },
                    ),
                    ButtonMachine(
                      type: dryer,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => Dialogku(
                                  mesin: dryer,
                                ));
                      },
                    )
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonMachine(
                      type: rollprof1,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => Dialogku(
                                  mesin: rollprof1,
                                ));
                      },
                    ),
                    ButtonMachine(
                      type: rollprof2,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => Dialogku(
                                  mesin: rollprof2,
                                ));
                      },
                    )
                  ]),
              // ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonMachine(
                      type: rollplat,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => Dialogku(
                                  mesin: rollplat,
                                ));
                      },
                    ),
                    ButtonMachine(
                      type: tayor,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => Dialogku(
                                  mesin: tayor,
                                ));
                      },
                    )
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonMachine(
                      type: radial,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => Dialogku(
                                  mesin: radial,
                                ));
                      },
                    ),
                    ButtonMachine(
                      type: geka,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => Dialogku(
                                  mesin: geka,
                                ));
                      },
                    )
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonMachine(
                      type: stamping,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => Dialogku(
                                  mesin: stamping,
                                ));
                      },
                    ),
                    ButtonMachine(
                      type: welding,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => Dialogku(
                                  mesin: welding,
                                ));
                      },
                    )
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonMachine(
                      type: bandsaw,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => Dialogku(
                                  mesin: bandsaw,
                                ));
                      },
                    ),
                    // ButtonMachine(
                    //   type: geka,
                    //   onPressed: () {
                    //     showDialog(
                    //         context: context,
                    //         builder: (BuildContext context) => Dialogku(
                    //               mesin: geka,
                    //             ));
                    //   },
                    // )
                  ]),
            ],
          ),
        ],
      ),
    );
  }
}
