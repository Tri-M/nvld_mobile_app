import 'package:flutter/material.dart';
import 'package:quiz_app/components/text_field_container.dart';
import 'package:quiz_app/constants.dart';

class DOBField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const DOBField({
    Key key,
    this.hintText,
    this.icon = Icons.calendar_month,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
