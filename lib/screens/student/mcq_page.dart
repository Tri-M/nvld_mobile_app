import 'package:flutter/material.dart';
import 'package:nvld_app/components/common_button.dart';
import 'package:nvld_app/components/common_layout.dart';
import 'package:nvld_app/components/option_tile.dart';
import 'package:nvld_app/components/text_container.dart';
import 'package:nvld_app/constants.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../components/question_card.dart';
import '../../components/question_navigation.dart';
import '../../models/Question.dart';

class McqPage extends StatefulWidget {
  @override
  State<McqPage> createState() => _McqPageState();
}

class _McqPageState extends State<McqPage> {
  int currQuestion = 0;
  late List<Question> questions;
  
  @override
  initState() {
    super.initState();
    questions = [
    Question(
      question: 'How many players are there in a cricket team?',
      options: ['11', '12', '13', '14'],
      answer: 1,
      type: "image",
      media:'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png'
    ),
    Question(
      question: 'Who is the captain of indian cricket team? ',
      options: ['MS Dhoni what a great player one of the best of all time', 'Virat Kohli', 'Rohit Sharma', 'Bhumra'],
      answer: 3,
      type: "video",
      media:"https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"
    ),
    
    Question(
      question: 'How many Idiots in a cricket team?',
      options: ['2', '12', '3', '4'],
      answer: 1,
      type: "text",
      media:''
    ),
  ];
  }
  

  @override
  Widget build(BuildContext context) {
    int submittedQuestions=questions.where((q) => q.selected!=null).length;
    int questionsLength = questions.length;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return CommonLayout(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.03, vertical: height * 0.01),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    if (currQuestion > 0)
                      setState(() {
                        currQuestion--;
                      });
                  },
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
                  onTap: () {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 3,
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return QuestionNavigation(
                            questions: questions,
                            totalQuestions: questionsLength,
                            // totalQuestions: 200,
                            currQuestion: currQuestion,
                            onTap: (int value) {
                              setState(() {
                                currQuestion = value;
                              });
                            },
                          );
                        });
                  },
                  child: CircleAvatar(
                    radius: width * 0.06,
                    backgroundColor: primaryPurple,
                    child: Center(
                        child: Icon(Icons.map_outlined,
                            color: Colors.white, size: width * 0.08)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (currQuestion != questionsLength - 1)
                      setState(() {
                        currQuestion++;
                      });
                  },
                  child: Row(
                    children: [
                      TextContainer(
                          text: 'Next',
                          presetFontSizes: [16, 14, 12, 10],
                          width: width * 0.14,
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
            SizedBox(height: height * 0.02),
            Container(
              height: height * 0.06,
              decoration: BoxDecoration(
                  color: Colors.white,
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
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: width*0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: width * 0.7,
                      child: LinearPercentIndicator(
                        width: width * 0.7,
                        lineHeight: 20.0,
                        barRadius: Radius.circular(20),
                        percent: submittedQuestions /
                            questionsLength,
                        backgroundColor: Colors.grey[200],
                        progressColor: primaryPurple,
                      ),
                    ),
                    Container(
                      width:width*0.15,
                      height:height*0.04,
                      decoration: BoxDecoration(
                        color:submittedQuestions!=questionsLength?Colors.grey[300]:primaryPurple.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child:Center(
                        child: TextContainer(
                          textAlign: TextAlign.center,
                          text: '${submittedQuestions}/${questionsLength}',
                          presetFontSizes: [16,14,12],
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            QuestionCard(question: questions[currQuestion]),
            // Text(questions[currQuestion].question),
            SizedBox(height: height * 0.02),
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  for (int i = 0;
                      i < questions[currQuestion].options.length;
                      i++)
                    OptionTile(
                      text: questions[currQuestion].options[i],
                      index: i + 1,
                      selected: questions[currQuestion].selected,
                      onTap: (int value) {
                        setState(() {
                          if (questions[currQuestion].selected != value)
                            questions[currQuestion].selected = value;
                          else {
                            questions[currQuestion].selected = null;
                            // questions[currQuestion].submitted = false;
                          }
                          // print('hi');
                        });
                      },
                    ),
                ],
              )),
            ),
            SizedBox(height: height * 0.03),
            CommonButton(
                height: height * 0.05,
                width: width * 0.6,
                text: 'SUBMIT TEST',
                onTap: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
