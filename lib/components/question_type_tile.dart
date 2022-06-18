import 'package:flutter/material.dart';
import 'package:nvld_app/components/text_container.dart';

import '../constants.dart';

class QuestionTypeTile extends StatelessWidget {
  
  String type;
  int currIndex;
  int index;
  Function onTap;
  QuestionTypeTile({required this.type,required this.currIndex,required this.index,required this.onTap});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap:(){
        onTap();
      },
      child: Container(
        height:height*0.06,
        width:width*0.2,
        decoration:BoxDecoration(
          color:currIndex==index?primaryPurple:Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child:Center(
          child: TextContainer(
            text:type,
            presetFontSizes: [20,18,16,14],
            width:width*0.18,
            textAlign: TextAlign.center,
            style: TextStyle(
              color:currIndex==index?Colors.white:Colors.black,
              fontWeight: FontWeight.w500,
            ),
            
          ),
        ),
      ),
    );
  }
}