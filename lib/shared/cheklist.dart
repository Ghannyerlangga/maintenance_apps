import 'package:flutter/material.dart';

class Checklist extends StatefulWidget {
  final String kata;
  final bool nilai;
  final ValueChanged<bool> onChanged;
  final ValueChanged<bool> onChanged2;
  const Checklist(
      {Key key, this.nilai, this.onChanged, this.onChanged2, this.kata})
      : super(key: key);
  @override
  _ChecklistState createState() => _ChecklistState();
}

class _ChecklistState extends State<Checklist> {
  @override
  Widget build(BuildContext context) {
    double lebar = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
      padding: EdgeInsets.only(left: lebar * 0.05),
      child: Row(
        children: <Widget>[
          Container(
            width: lebar * 0.60,
            child: Text(widget.kata),
          ),
          Container(
            width: lebar * 0.15,
            child: Checkbox(value: widget.nilai, onChanged: widget.onChanged),
          ),
          Container(
            width: lebar * 0.15,
            child: Checkbox(value: !widget.nilai, onChanged: widget.onChanged2),
          ),
        ],
      ),
    );
  }
}
