import 'package:flutter/material.dart';
import 'package:nvld_app/components/text_container.dart';

import '../constants.dart';

class CommonButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final Function onTap;
  CommonButton({required this.height,required this.width,required this.text,required this.onTap});

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap:(){
        onTap();
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                colors: [primaryPurple, Colors.purple],
                // stops: [0.4,1],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(
                  1,
                  3,
                ),
                blurRadius: 4,
                spreadRadius: 2.0,
              ),
            ]),
        child: Center(
          child: TextContainer(
            text: text,
            presetFontSizes: [24, 22, 20, 18, 16],
            textAlign: TextAlign.center,
            width:width*0.6,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
