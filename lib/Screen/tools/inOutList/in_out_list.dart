import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/tools/components/tools_select.dart';
import 'package:maintenance_apps/Screen/tools/inOutList/list_out_consumable.dart';
import 'package:maintenance_apps/Screen/tools/inOutList/list_out_sparepart.dart';
import 'package:maintenance_apps/Screen/tools/inOutList/list_peminjaman_mesin.dart';
import 'package:maintenance_apps/shared/button_menu.dart';

class OutInList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            Container(
              margin: EdgeInsets.only(
                  top: size.height * 0.1, bottom: size.height * 0.1),
              child: Column(
                children: [
                  ButtonMenu(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ListPeminjamanMesin();
                      }));
                    },
                    image: 'img/engine.png',
                    text: "PINJAM MESIN/ALAT",
                  ),
                  SizedBox(height: size.height * 0.03),
                  ButtonMenu(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ListOutSparePart();
                      }));
                    },
                    image: 'img/SparepartFlatIcon.png',
                    text: "OUT SPAREPARTS",
                  ),
                  SizedBox(height: size.height * 0.03),
                  ButtonMenu(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ListOutConsumable();
                      }));
                    },
                    image: 'img/ConsumableIcon8.png',
                    text: "OUT CONSUMABLES",
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
