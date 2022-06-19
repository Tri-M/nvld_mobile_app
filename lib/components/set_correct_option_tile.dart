import 'package:flutter/material.dart';
import 'package:nvld_app/components/text_container.dart';

import '../constants.dart';

class SetCorrectOptionTile extends StatefulWidget {  

  Function(int) onTap;
  SetCorrectOptionTile({required this.onTap});

  @override
  State<SetCorrectOptionTile> createState() => _SetCorrectOptionTileState();
}

class _SetCorrectOptionTileState extends State<SetCorrectOptionTile> {
  int correctIndex=-1;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Row(
      children: [
        InkWell(
          onTap:(){
            
            setState(() {
              correctIndex=0;
            });
            widget.onTap(0);

          },
          child: Container(
            height:height*0.06,
            width:width*0.1,
            decoration:BoxDecoration(
              color:correctIndex==0?Colors.green:Colors.grey[200],
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
            ),
            child:Center(
              child: TextContainer(
                text:'A',
                presetFontSizes: [20,18,16,14],
                width:width*0.18,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:correctIndex==0?Colors.white:Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                
              ),
            ),
          ),
        ),
        InkWell(
          onTap:(){
            setState(() {
              correctIndex=1;
            });
              widget.onTap(1);
          },
          child: Container(
            height:height*0.06,
            width:width*0.1,
            decoration:BoxDecoration(
              color:correctIndex==1?Colors.green:Colors.grey[200],
              // borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
            ),
            child:Center(
              child: TextContainer(
                text:'B',
                presetFontSizes: [20,18,16,14],
                width:width*0.18,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:correctIndex==1?Colors.white:Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                
              ),
            ),
          ),
        ),
        InkWell(
          onTap:(){
            setState(() {
              correctIndex=2;
            });
            widget.onTap(2);
          },
          child: Container(
            height:height*0.06,
            width:width*0.1,
            decoration:BoxDecoration(
              color:correctIndex==2?Colors.green:Colors.grey[200],
              // borderRadius: BorderRadius.circular(10)
            ),
            child:Center(
              child: TextContainer(
                text:'C',
                presetFontSizes: [20,18,16,14],
                width:width*0.18,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:correctIndex==2?Colors.white:Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                
              ),
            ),
          ),
        ),
        InkWell(
          onTap:(){
            setState(() {
              correctIndex=3;
            });
              widget.onTap(3);
          },
          child: Container(
            height:height*0.06,
            width:width*0.1,
            decoration:BoxDecoration(
              color:correctIndex==3?Colors.green:Colors.grey[200],
              borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
            ),
            child:Center(
              child: TextContainer(
                text:'D',
                presetFontSizes: [20,18,16,14],
                width:width*0.18,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:correctIndex==3?Colors.white:Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                
              ),
            ),
          ),
        ),

        
      ],
    );
  }
}