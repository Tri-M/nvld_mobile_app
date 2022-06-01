import 'package:flutter/material.dart';
import 'package:nvld_app/components/text_field_container.dart';
import 'package:nvld_app/constants.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  RoundedPasswordField({required this.onChanged});

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _flag = true;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: widget.onChanged,
        cursorColor: kPrimaryColor,
        decoration: const InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          // suffixIcon: IconButton(
          //   icon: Icon(
          //     _flag ? Icons.visibility : Icons.visibility_off,
          //     color: kPrimaryColor,
          //   ),
          //   onPressed: () {
          //     setState(() {
          //       _flag = !_flag;
          //     });
          //   },
          // ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
