import 'package:flutter/material.dart';
import 'package:nvld_app/components/text_container.dart';

import '../constants.dart';

class OptionTile extends StatelessWidget {
  final String text;
  final int index;
  final int? selected;
  final Function(int) onTap;
  OptionTile({required this.text, required this.index,required this.selected,required this.onTap});

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
      width:width*0.92,
      padding: EdgeInsets.symmetric(vertical: height*0.01,horizontal:width*0.01),
      child: InkWell(
        onTap:(){
          onTap(index);
        },
        child: Container(
          width: width * 0.9,
          height: height * 0.09,
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.04),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: selected!=null && selected==index?LinearGradient(
                colors:[
                  primaryPurple,
                  Colors.purple
                ],
                // stops: [0.4,1],
                begin:Alignment.topLeft,
                end:Alignment.bottomRight
              ):LinearGradient(colors: [Colors.white,Colors.white]),
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
                  radius: width*0.05,
                  backgroundColor: selected!=null && selected==index?Colors.purple:Colors.grey[300],
                  child:Center(
                    child: TextContainer(text: optionChar, presetFontSizes: [20,18,16,14],
                      width:width*0.08,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:selected!=null && selected==index?Colors.white:primaryPurple,
                      ),
                    ),
                  )
                ),
                SizedBox(width:width*0.02),
                TextContainer(
                  text: text,
                  presetFontSizes: [26,24,22,20,18,16,14,12,10,8],
                  maxlines: 3,
                  width:width*0.7,
                  style: TextStyle(
                    color:selected!=null && selected==index?Colors.white:Colors.black,
                    
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
