import 'package:flutter/material.dart';
import 'package:nvld_app/components/text_container.dart';

import '../constants.dart';
import '../models/Question.dart';

class QuestionNavigation extends StatefulWidget {
  final Function(int) onTap;
  final int totalQuestions;
  int currQuestion;
  List<Question> questions;
  QuestionNavigation({required this.questions,required this.onTap,required this.totalQuestions,required this.currQuestion});

  @override
  State<QuestionNavigation> createState() => _QuestionNavigationState();
}

class _QuestionNavigationState extends State<QuestionNavigation> {
  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height;
    double width= MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width*0.02,vertical:height*0.02),
        height:height*0.8,
        child:SingleChildScrollView(
          child: Wrap(
            spacing: width*0.017,
            runSpacing: height*0.01,
            children: [
              for (int i=0;i<widget.totalQuestions;i++)
                InkWell(
                  onTap: () {
                    widget.onTap(i);
                    setState(() {
                      widget.currQuestion=i;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: widget.currQuestion==i?primaryPurple:widget.questions[i].selected!=null?Colors.blueGrey[900]:Colors.grey[300],
                    radius: width*0.05,
                    child: Center(
                      child: TextContainer(
                        text: (i+1).toString(),
                        textAlign: TextAlign.center,
                        presetFontSizes: [18,16,14,12],
                        width:width*0.07,
                        style: TextStyle(
                          color:widget.currQuestion==i || widget.questions[i].selected!=null?Colors.white:Colors.black,
                        ),
                      )
                    ),
                  ),
                )
            ]
          ),
        ),
    );
  }
}