import 'package:flutter/material.dart';
import 'package:nvld_app/constants.dart';

class CommonLayout extends StatelessWidget {
  final Widget child;
  CommonLayout({required this.child});
  @override
  Widget build(BuildContext context) {
    double width =MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Container(
      color:background,
      child: SafeArea(
        child: Scaffold(
          backgroundColor:background,
          body:Container(
            height:height,
            width:width,
            child:child,
          ),
        ),
      ),
    );
  }
}