import 'package:flutter/material.dart';
import 'package:maintenance_apps/shared/constant.dart';

class Input extends StatelessWidget {
  final String leading;
  final String hint;
  final TextEditingController controller;
  final Function onTap;

  const Input({Key key, this.leading, this.hint, this.controller, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onTap: onTap,
        controller: controller,
        decoration: textInputDecoration.copyWith(
          labelText: leading,
          hintText: hint,
        ),
      ),
    );
  }
}
