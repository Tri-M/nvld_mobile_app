import 'package:flutter/material.dart';
import 'package:nvld_app/components/text_container.dart';

import '../constants.dart';

class OptionTile extends StatelessWidget {
  final String text;
  final int index;
  final int? selected;
  final bool submitted;
  final int answer;
  final Function(int) onTap;
  OptionTile({required this.text, required this.index,required this.selected,required this.onTap,required this.submitted,required this.answer});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final String optionChar = String.fromCharCode(index+65);
    return Container(
      width:width*0.92,
      padding: EdgeInsets.symmetric(vertical: height*0.01,horizontal:width*0.01),
      child: InkWell(
        onTap:(){
          if (!submitted)
          onTap(index);
        },
        child: Container(
          width: width * 0.9,
          // height: height * 0.09,
          constraints: BoxConstraints(
            minHeight: height * 0.09,
          ),
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.04,vertical:height*0.005),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: !submitted?selected!=null && selected==index?LinearGradient(
                colors:[
                  primaryPurple,
                  Colors.purple
                ],
                // stops: [0.4,1],
                begin:Alignment.topLeft,
                end:Alignment.bottomRight
              ):LinearGradient(colors: [Colors.white,Colors.white]):
              index==answer?LinearGradient(colors: [Colors.greenAccent,Colors.greenAccent]):
              selected==index && selected!=answer?LinearGradient(colors: [Colors.redAccent,Colors.redAccent]):
              LinearGradient(colors: [Colors.white,Colors.white]),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                CircleAvatar(
                  radius: width*0.05,
                  backgroundColor: !submitted?selected!=null && selected==index?Colors.purple:Colors.grey[300]:
                  index==answer?Colors.greenAccent[100]:selected==index && selected!=answer?Colors.redAccent[100]:Colors.grey[300],
                  child:TextContainer(text: optionChar, presetFontSizes: [20,18,16,14],
                    width:width*0.08,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:!submitted?selected!=null && selected==index ?Colors.white:primaryPurple:
                      index==answer?Colors.black:selected==index && selected!=answer?Colors.white:primaryPurple,
                      
                    ),
                  )
                ),
                SizedBox(width:width*0.02),
                TextContainer(
                  text: text,
                  presetFontSizes: [20,18,],
                  maxlines: 10,
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
