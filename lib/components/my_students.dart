import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nvld_app/components/text_container.dart';
import 'package:nvld_app/constants.dart';
import 'package:nvld_app/models/my_students.dart';
import 'package:nvld_app/screens/staff/responsiveness.dart';
import 'package:nvld_app/screens/staff/student_invite.dart';
import 'package:nvld_app/screens/staff/upload_question_page.dart';
import 'info_card.dart';
import 'dart:convert';

class MyStudents extends StatelessWidget {
  const MyStudents({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          width: width * 0.9,
          height: (height + width) * 0.1,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: kPrimaryLightColor,
            elevation: 10,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(
                    top: height * 0.025,
                    left: width * 0.05,
                  ),
                  child: TextContainer(
                    text: 'Add new students',
                    presetFontSizes: [18, 16, 14],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                SizedBox(height: defaultPadding),
                Container(
                  height: (height + width) * 0.03,
                  width: (height + width) * 0.14,
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      onPrimary: kPrimaryLightColor,
                      primary: kPrimaryColor,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudentInviteScreen(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          size: (height + width) * 0.015,
                          color: kPrimaryLightColor,
                        ),
                        TextContainer(
                          text: "Invite",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kPrimaryLightColor,
                          ),
                          presetFontSizes: [18, 16, 14, 12],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: defaultPadding,
        ),
        SizedBox(
          width: width * 0.9,
          height: (height + width) * 0.1,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: kPrimaryLightColor,
            elevation: 10,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(
                    top: height * 0.025,
                    left: width * 0.05,
                  ),
                  child: TextContainer(
                    text: 'Upload new question',
                    presetFontSizes: [18, 16, 14],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                SizedBox(height: defaultPadding),
                Container(
                  height: (height + width) * 0.03,
                  width: (height + width) * 0.14,
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      onPrimary: kPrimaryLightColor,
                      primary: kPrimaryColor,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UploadQuestionPage(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          size: (height + width) * 0.015,
                          color: kPrimaryLightColor,
                        ),
                        TextContainer(
                          text: "Question",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kPrimaryLightColor,
                          ),
                          presetFontSizes: [18, 16, 14, 12],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: defaultPadding),
        TextContainer(
          text: "My Students",
          presetFontSizes: [24, 22, 20, 18, 16],
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        StudentCard(name: 'Abishek', email: 'abishek@gmail.com'),
        StudentCard(name: 'Trisha', email: 'trisha@gmail.com'),
        StudentCard(name: 'Karthik', email: 'karthik@gmail.com'),
        const SizedBox(
          height: defaultPadding,
        ),
        Responsiveness(
          mobile: StudentInfoCardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 ? 1.3 : 1,
          ),
          tablet: StudentInfoCardGridView(),
          desktop: StudentInfoCardGridView(
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
          ),
        ),
      ],
    );
  }
}

class StudentCard extends StatelessWidget {
  final String name;
  final String email;
  const StudentCard({
    Key? key,
    required this.name,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: defaultPadding,
        ),
        Container(
          height: (height + width) * 0.065,
          width: (width + height) * 0.45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: kPrimaryLightColor,
            boxShadow: [
              BoxShadow(
                color: kPrimaryColor,
                offset: Offset(
                  0,
                  height * 0.005,
                ),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
              left: width * 0.05,
              top: height * 0.025,
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextContainer(
                      text: name,
                      presetFontSizes: [18, 16, 14],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                    TextContainer(
                      text: email,
                      presetFontSizes: [18, 16, 14],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class StudentInfoCardGridView extends StatelessWidget {
  const StudentInfoCardGridView({
    Key? key,
    this.crossAxisCount = 6,
    this.childAspectRatio = 2,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: myStudents.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => InfoCard(info: myStudents[index]),
    );
  }
}
