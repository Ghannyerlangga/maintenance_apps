import 'package:flutter/material.dart';

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