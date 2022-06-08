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
    final _size=MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextContainer(
              text:"My Students",
              presetFontSizes: [24,22,20,18,16,14],
              style:TextStyle(
                fontWeight: FontWeight.w600,
                color:Colors.white,
              )
            ),
            InkWell(
              onTap:(){
                
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StudentInviteScreen()));
              },
              child: Container(
                width: width * 0.25,
                height:height*0.045,
                decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add,size:width*0.04,),
                    TextContainer(
                      width:width*0.15,
                      // textAlign: TextAlign.center,
                      text:'Invite',
                      maxlines: 1,
                      presetFontSizes: [18,16, 14, 12,10,8]
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap:(){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UploadQuestionPage()));
              },
              child: Container(
                width: width * 0.25,
                height:height*0.045,
                decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add,size:width*0.04,),
                    TextContainer(
                      width:width*0.2,
                      text:'Question',
                      // textAlign: TextAlign.center,
                      maxlines: 1,
                      presetFontSizes: [16, 14, 12,10,8]
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: defaultPadding),
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

class StudentInfoCardGridView extends StatelessWidget {
  const StudentInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
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
