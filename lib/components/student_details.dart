import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import 'chart.dart';
import 'student_info_card.dart';

class StudentDetails extends StatelessWidget {
  const StudentDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Overall Performance",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          Chart(),
          StudentInfoCard(
            //SvgPicture.asset("assets/images/logo.png"),
            title: "5-7 years",
            percent_of_students: "13%",
            no_of_quizzes: 1328,
          ),
          StudentInfoCard(
            //svgSrc: "assets/images/logo.png",
            title: "8-10 years",
            percent_of_students: "80%",
            no_of_quizzes: 1328,
          ),
          StudentInfoCard(
            //svgSrc:"assets/images/logo.png",
            title: "11-13 years",
            percent_of_students: "34%",
            no_of_quizzes: 1328,
          ),
          StudentInfoCard(
            //svgSrc:"assets/images/logo.png" ,
            title: "14-16 years",
            percent_of_students: "12%",
            no_of_quizzes: 140,
          ),
        ],
      ),
    );
  }
}