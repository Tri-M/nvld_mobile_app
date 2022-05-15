import 'package:flutter/material.dart';
import 'package:nvld_app/components/text_container.dart';

import '../constants.dart';

class OptionTile extends StatelessWidget {
  final String text;
  final int index;
  OptionTile({required this.text, required this.index});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final String optionChar = index == 1
        ? 'A'
        : index == 2
            ? 'B'
            : index == 3
                ? 'C'
                : 'D';
    return Container(
      width: width * 0.9,
      height: height * 0.1,
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: primaryPurple,
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
        child: Row(
          children:[
            CircleAvatar(
              radius: height*0.03,
              backgroundColor: lightPurple,
            ),
            TextContainer(
              text: text,
              presetFontSizes: [16,14,12,10,8],
              maxlines: 3,
              width:width*0.75,
            )
          ],
        ),
      ),
    );
  }
}
