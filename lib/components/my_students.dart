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
        SizedBox(height: defaultPadding),
        SizedBox(
          width: width * 0.9,
          height: height * 0.18,
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
                    top: height * 0.0025,
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
                  height: height * 0.05,
                  width: width * 0.3,
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      onPrimary: kPrimaryLightColor,
                      primary: kPrimaryColor,
                      padding: EdgeInsets.symmetric(
                        vertical: height * 0.01,
                        horizontal: width * 0.02,
                      ),
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
                          size: (height + width) * 0.02,
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
        SizedBox(height: defaultPadding),
        SizedBox(
          width: width * 0.9,
          height: height * 0.18,
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
                  height: height * 0.05,
                  width: width * 0.35,
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      onPrimary: kPrimaryLightColor,
                      primary: kPrimaryColor,
                      padding: EdgeInsets.symmetric(
                        vertical: height * 0.01,
                        horizontal: width * 0.02,
                      ),
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
                          size: (height + width) * 0.02,
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

class StudentCard extends StatefulWidget {
  const StudentCard({Key? key}) : super(key: key);

  @override
  State<StudentCard> createState() => _StudentCardState();
}

class _StudentCardState extends State<StudentCard> {
  @override
  Widget build(BuildContext context) {
    return Container();
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
