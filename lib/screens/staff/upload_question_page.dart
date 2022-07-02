import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:nvld_app/components/question_type_tile.dart';
import 'package:nvld_app/components/set_correct_option_tile.dart';
import 'package:nvld_app/components/upload_file.dart';
import 'package:nvld_app/components/upload_question_text_field.dart';
import 'package:provider/provider.dart';

import '../../components/common_button.dart';
import '../../components/common_layout.dart';
import '../../components/text_container.dart';
import '../../constants.dart';
import '../../provider/user_provider.dart';

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
  File file = File("");

  final ImagePicker _picker = ImagePicker();

  Future<File> getImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        File file = File(image.path);
        return file;
        // print(image.path);
        // var snapshot =
        //     await storage.ref().child('images/logo').putFile(file);
        // if (snapshot.state==TaskState.success){
        //   Fluttertoast.showToast(msg: "Image Uploaded Successfully");
        //   var imageUrl = await (snapshot).ref.getDownloadURL();
        //   var url = imageUrl.toString();
        //   Provider.of<UserProvider>(context,listen:false).logoUrl= url;
        //   setState(() {

        //   });
        // }
        // print(url);
        // var snapshot2= storage.ref().child('images/logo');
        // var imageUrl = await (snapshot2).getDownloadURL();
        // print(imageUrl.toString());
      } else {
        throw ("Invalid");
      }
    } catch (e) {
      throw (e);
    }
    // return null;
  }

  void uploadQuestion(Map<String, dynamic> questionMap, String cat) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    FirebaseStorage storage = FirebaseStorage.instance;
    if (questionMap["type"] == "text") {
      await firebaseFirestore
          .collection("mCategory$cat")
          .doc()
          .set(questionMap);
      Fluttertoast.showToast(msg: "Question Uploaded Success");
    } else {
      DateTime currentPhoneDate = DateTime.now(); //DateTime
      Timestamp myTimeStamp = Timestamp.fromDate(currentPhoneDate);
      String? mimeStr = lookupMimeType(file.path);
      var fileType = mimeStr!.split('/');
      // print('file type ${fileType}');
      var snapshot = await storage
          .ref()
          .child('images/mCategory$cat/$myTimeStamp')
          .putFile(file);
      if (snapshot.state == TaskState.success) {
        Fluttertoast.showToast(msg: "Image Uploaded Successfully");
        var imageUrl = await (snapshot).ref.getDownloadURL();
        var url = imageUrl.toString();
        questionMap["url"] = url;
        questionMap["type"] = fileType[0] == 'image' ? 'image' : 'video';
        await firebaseFirestore
            .collection("mCategory$cat")
            .doc()
            .set(questionMap);
        Fluttertoast.showToast(msg: "Question Uploaded Success");
      }
    }
  }

  int correctOption = 0;
  String catValue = 'Nursery';
  String optionsValue='A';
  List<String> catItems = ['Nursery', '2-5', '6-9', '10-12'];
  List<String> optionsItems= ['A','B','C','D'];
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
                      Container(
                        width:width*0.3,
                        // height:height*0.06,
                        child: DropdownButtonFormField(
                          isExpanded: true,
                          
                            decoration: InputDecoration(

                              enabledBorder: OutlineInputBorder(
                                // borderSide:
                                    // BorderSide(color: , width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              border: OutlineInputBorder(
                                // borderSide:
                                    // BorderSide(color: Colors.blue, width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                              fillColor: primaryPurple,
                            ),
                            dropdownColor: primaryPurple.withOpacity(1),
                            value: catValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                catValue = newValue!;
                              });
                            },
                            items: catItems.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Center(child: Text(value,style: TextStyle(color:Colors.white),textAlign: TextAlign.center,)),
                              );
                            }).toList()),
                      ),
                      // SizedBox(width: width * 0.05),
                      QuestionTypeTile(
                        type: 'Media',
                        currIndex: currIndex,
                        index: 1,
                        onTap: () {
                          setState(() {
                            if (currIndex == 0)
                              currIndex = 1;
                            else
                              currIndex = 0;
                          });
                        },
                      ),
                      Container(
                            width:width*0.3,
                            // height:height*0.06,
                            child: DropdownButtonFormField(
                              isExpanded: true,
                              
                                decoration: InputDecoration(

                                  enabledBorder: OutlineInputBorder(
                                    // borderSide:
                                        // BorderSide(color: , width: 2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  border: OutlineInputBorder(
                                    // borderSide:
                                        // BorderSide(color: Colors.blue, width: 2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                  fillColor: primaryPurple,
                                ),
                                dropdownColor: primaryPurple.withOpacity(1),
                                value: optionsValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    optionsValue = newValue!;
                                  });
                                },
                                items: optionsItems.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Center(child: Text(value,style: TextStyle(color:Colors.white),textAlign: TextAlign.center,)),
                                  );
                                }).toList()),
                          ),
                      // Container(
                      //   height: height * 0.05,
                      //   color: Colors.black,
                      //   width: 2,
                      // ),

                      // SetCorrectOptionTile(onTap: (value) {
                      //   setState(() {
                      //     correctOption = value;
                      //   });
                      // })
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  if (currIndex == 0)
                    UploadQuestionTextField(
                        controller: questionController,
                        maxlines: 5,
                        hintText: 'Enter your question...'),
                  if (currIndex != 0)
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: height * 0.04),
                        TextContainer(
                          text: 'Do you want to upload a file?',
                          presetFontSizes: [24, 22, 20, 18],
                          maxlines: 1,
                          style: const TextStyle(
                              // color: ,
                              fontWeight: FontWeight.w500),
                          width: width * 0.8,
                        ),
                        SizedBox(height: height * 0.03),
                        file.path == ""
                            ? Center(
                                child: UploadFileButton(
                                  height: height * 0.12,
                                  width: height * 0.12,
                                  buttonBackgroundColor: primaryPurple,
                                  glowColor: lightPurple,
                                  child: Center(
                                    child: Icon(
                                      Icons.upload,
                                      color: Colors.white,
                                      size: height * 0.06,
                                    ),
                                  ),
                                  onTap: () async {
                                    File imageFile = await getImage();
                                    print(imageFile.path);
                                    String? mimeStr =
                                        lookupMimeType(imageFile.path);
                                    var fileType = mimeStr!.split('/');
                                    print('file type ${fileType}');

                                    setState(() {
                                      file = imageFile;
                                    });
                                  },
                                ),
                              )
                            : Center(
                                child: UploadFileButton(
                                  height: height * 0.12,
                                  width: height * 0.12,
                                  buttonBackgroundColor: Colors.green,
                                  glowColor: Colors.green[100],
                                  child: Center(
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: height * 0.06,
                                    ),
                                  ),
                                  onTap: () async {
                                    File imageFile = await getImage();
                                    print(imageFile.path);

                                    setState(() {
                                      file = imageFile;
                                    });
                                  },
                                ),
                              ),
                        SizedBox(height: height * 0.1),
                        CommonButton(
                            height: height * 0.06,
                            width: width * 0.8,
                            text: 'Back to Question',
                            onTap: () {
                              setState(() {
                                currIndex = 0;
                              });
                            })
                      ],
                    ),
                  if (currIndex == 0)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                ],
              ),
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            String cat=catValue=='Nursery'?'1':catValue=='2-5'?'2':catValue=='6-9'?'3':'4';
            int cOp=optionsValue=='A'?0:optionsValue=='B'?1:optionsValue=='C'?2:3;
            
            if (optionAController.text != '' &&
                optionBController.text != '' &&
                optionCController.text != '' &&
                optionDController.text != '') {
              if (questionController.text != "" &&
                  correctOption != -1 &&
                  file.path == "") {
                Map<String, dynamic> questionMap = {
                  'question': questionController.text,
                  'options': <String>[
                    optionAController.text,
                    optionBController.text,
                    optionDController.text
                  ],
                  'type': "text",
                  'answer': cOp,
                  'url': ""
                };
                uploadQuestion(questionMap, cat);
              }
              if (questionController.text != "" &&
                  correctOption != -1 &&
                  file.path != "") {
                // uploadQuestion();

                Map<String, dynamic> questionMap = {
                  'question': questionController.text,
                  'options': <String>[
                    optionAController.text,
                    optionBController.text,
                    optionCController.text,
                    optionDController.text
                  ],
                  'answer': correctOption,
                  'type': 'not-text',
                  'url': '',
                };
                // print()
                uploadQuestion(questionMap, cat);
              }
              if (correctOption == -1) {
                Fluttertoast.showToast(msg: "Please choose the correct option");
              }
              if (questionController.text == "") {
                Fluttertoast.showToast(msg: "Please enter the question");
              }
            } else {
              Fluttertoast.showToast(msg: "Please fill all the options");
            }
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
