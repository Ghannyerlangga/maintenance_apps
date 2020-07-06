import 'package:flutter/material.dart';
import 'package:maintenance_apps/Screen/tools/list_mesin.dart';

class Tools extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('List Machine'),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder:(contex){
                    return ListMesin();
                  } ));
              }),
            RaisedButton(
              child: Text('Repair'),
              onPressed: (){

              }),
            RaisedButton(
              child: Text('Consumable'),
              onPressed: (){

              })
          ],
        ),
      ),
    );
  }
}