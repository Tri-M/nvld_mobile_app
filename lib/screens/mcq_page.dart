import 'package:flutter/material.dart';
import 'package:nvld_app/components/common_layout.dart';
import 'package:nvld_app/components/option_tile.dart';
import 'package:nvld_app/components/text_container.dart';
import 'package:nvld_app/constants.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../models/Question.dart';

class McqPage extends StatefulWidget {
  @override
  State<McqPage> createState() => _McqPageState();
}

class _McqPageState extends State<McqPage> {
  int currQuestion=0;
  List<Question> questions=[
    Question(
      question:'Who is the captain of indian cricket team?',
      options:[
        'MS Dhoni','Virat Kohli','Rohit Sharma','Bhumra'
      ],
      answer:3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return CommonLayout(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.01),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back_ios,
                          size: width * 0.04, color: primaryPurple),
                      SizedBox(width: width * 0.01),
                      TextContainer(
                          text: 'Previous',
                          presetFontSizes: [16, 14, 12, 10],
                          width: width * 0.2,
                          style: TextStyle(
                              color: primaryPurple,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      TextContainer(
                          text: 'Next',
                          presetFontSizes: [16, 14, 12, 10],
                          width: width * 0.2,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: primaryPurple,
                              fontWeight: FontWeight.bold)),
                      SizedBox(width: width * 0.01),
                      Icon(Icons.arrow_forward_ios,
                          size: width * 0.04, color: primaryPurple),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.04),
            Container(
              height: height * 0.06,
              decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.circular(20),
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
                  child:Row(
                    children:[
                      Container(
                        width:width*0.7,
                        
                        child:LinearPercentIndicator(
                          width: width*0.7,
                          lineHeight: 20.0,
                          barRadius:Radius.circular(20),
                          percent: 0.5,
                          backgroundColor: Colors.grey[200],
                          progressColor: primaryPurple,
                        ),
                      ),
                    ],
                  ),

            ),
            SizedBox(height:height*0.02),
            Container(
              padding:EdgeInsets.symmetric(horizontal:width*0.02,vertical:height*0.01),
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(20),
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
                  ],
                  color:Colors.white,
                  

              ),
              child: TextContainer(
                text: questions[currQuestion].question,
                textAlign: TextAlign.center,
                presetFontSizes: [30,28,26,24,22,20,18,16, 14, 12, 10],
                maxlines: 5,
                width: width * 0.9,
                height:height*0.17,
              ),
            ),
            SizedBox(height:height*0.02),
            for (int i=0;i<questions[currQuestion].options.length;i++)
              OptionTile(text: questions[currQuestion].options[i], index: i,selected:questions[currQuestion].selected,
                onTap: (int value){
                  setState(() {
                    questions[currQuestion].selected=value;
                    // print('hi');
                  });
                },
              )
            
          ],
        ),
      ),
    );
  }
}
