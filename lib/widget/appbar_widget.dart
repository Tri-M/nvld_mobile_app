import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    leading: const BackButton(
      color: Colors.black,
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
  );
}
