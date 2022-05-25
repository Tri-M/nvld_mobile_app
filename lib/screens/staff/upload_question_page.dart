import 'package:flutter/material.dart';
import 'package:nvld_app/components/question_type_tile.dart';
import 'package:nvld_app/components/upload_file.dart';
import 'package:nvld_app/components/upload_question_text_field.dart';

import '../../components/common_layout.dart';
import '../../components/text_container.dart';
import '../../constants.dart';

class UploadQuestionPage extends StatefulWidget {
  const UploadQuestionPage({Key? key}) : super(key: key);

  @override
  State<UploadQuestionPage> createState() => _UploadQuestionPageState();
}

class _UploadQuestionPageState extends State<UploadQuestionPage> {
  TextEditingController questionController = TextEditingController();
  TextEditingController optionAController = TextEditingController();
  TextEditingController optionBController = TextEditingController();
  TextEditingController optionCController = TextEditingController();
  TextEditingController optionDController = TextEditingController();
  int currIndex = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.03, vertical: height * 0.01),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: width * 0.26,
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
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      QuestionTypeTile(
                        type: 'TEXT',
                        currIndex: currIndex,
                        index: 0,
                        onTap: () {
                          setState(() {
                            currIndex = 0;
                          });
                        },
                      ),
                      QuestionTypeTile(
                        type: 'IMAGE',
                        currIndex: currIndex,
                        index: 1,
                        onTap: () {
                          setState(() {
                            currIndex = 1;
                          });
                        },
                      ),
                      QuestionTypeTile(
                        type: 'VIDEO',
                        currIndex: currIndex,
                        index: 2,
                        onTap: () {
                          setState(() {
                            currIndex = 2;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  if (currIndex==0)
                  UploadQuestionTextField(
                      controller: questionController,
                      maxlines: 5,
                      hintText: 'Enter your question...'),
                  if (currIndex!=0)
                    SizedBox(height:height*0.03),
                  if (currIndex!=0)
                  Center(
                    child: UploadFileButton(
                      height:height*0.12,
                      width:height*0.12,
                      buttonBackgroundColor: primaryPurple,
                      glowColor: lightPurple,
                      child: Center(
                        child: Icon(
                          Icons.upload,
                          color: Colors.white,
                          size: height*0.06,
                        ),
                      ),
                      onTap: (){},
                    ),
                  ),
                  if (currIndex!=0)
                    SizedBox(height:height*0.02),
                  SizedBox(height: height * 0.01),
                  TextContainer(
                    text: 'Option A',
                    presetFontSizes: [16, 14, 12, 10],
                    style: TextStyle(
                      color: primaryPurple,
                    ),
                  ),
                  SizedBox(height: height * 0.005),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.02),
                    child: UploadQuestionTextField(
                        controller: optionAController,
                        maxlines: 2,
                        hintText: 'Enter option A...'),
                  ),
                  SizedBox(height: height * 0.01),
                  TextContainer(
                    text: 'Option B',
                    presetFontSizes: [16, 14, 12, 10],
                    style: TextStyle(
                      color: primaryPurple,
                    ),
                  ),
                  SizedBox(height: height * 0.005),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.02),
                    child: UploadQuestionTextField(
                        controller: optionBController,
                        maxlines: 2,
                        hintText: 'Enter option B...'),
                  ),
                  SizedBox(height: height * 0.01),
                  TextContainer(
                    text: 'Option C',
                    presetFontSizes: [16, 14, 12, 10],
                    style: TextStyle(
                      color: primaryPurple,
                    ),
                  ),
                  SizedBox(height: height * 0.005),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.02),
                    child: UploadQuestionTextField(
                        controller: optionCController,
                        maxlines: 2,
                        hintText: 'Enter option C...'),
                  ),
                  TextContainer(
                    text: 'Option D',
                    presetFontSizes: [16, 14, 12, 10],
                    style: TextStyle(
                      color: primaryPurple,
                    ),
                  ),
                  SizedBox(height: height * 0.005),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.02),
                    child: UploadQuestionTextField(
                        controller: optionDController,
                        maxlines: 2,
                        hintText: 'Enter option D...'),
                  ),
                  SizedBox(height: height * 0.01),
                ],
              ),
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (questionController.text!="")
              print('hi');
          },
          backgroundColor: primaryPurple,
          child: Transform.rotate(
            angle: -40 * 3.145 / 180,
            child: Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
