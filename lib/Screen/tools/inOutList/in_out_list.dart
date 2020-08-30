import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/tools/components/tools_select.dart';
import 'package:maintenance_apps/Screen/tools/inOutList/list_out_consumable.dart';
import 'package:maintenance_apps/Screen/tools/inOutList/list_out_sparepart.dart';
import 'package:maintenance_apps/Screen/tools/inOutList/list_peminjaman_mesin.dart';

class OutInList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Out In List".toUpperCase(),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.blue[100],
        body: ListView(
          children: <Widget>[
            // Expanded(
            Selection(
              onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ListPeminjamanMesin();
                }));
              },
              image: Image.asset(
                'img/MaintenanceIcon8.png',
                width: 40,
                height: 40,
              ),
              title: "Peminjaman Mesin / Alat",
            ),
            Selection(
              onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ListOutSparePart();
                }));
              },
              image: Image.asset(
                'img/MachineFlatIcon.png',
                width: 40,
                height: 40,
              ),
              title: "Out Spare Parts",
            ),
            Selection(
              onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ListOutConsumable();
                }));
              },
              image: Image.asset(
                'img/repairFlatIcon.png',
                width: 40,
                height: 40,
              ),
              title: "Out Consumables",
            )
          ],
        ));
  }
}
