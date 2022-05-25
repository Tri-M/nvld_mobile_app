import 'package:flutter/material.dart';

import '../constants.dart';

class UploadQuestionTextField extends StatelessWidget {
  int maxlines;
  TextEditingController controller;
  String hintText;
  UploadQuestionTextField({required this.controller,required this.maxlines,required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Colors.blueGrey[900],
      maxLines: maxlines,
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          // fontWeight: FontWeight.w600,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: primaryPurple,
            width: 1,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: primaryPurple,
            width: 1,
          ),
        ),
      ),
    );
  }
}
