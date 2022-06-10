import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

import "../../../constants.dart";

class StudentInfoCard extends StatelessWidget {
  const StudentInfoCard(
      {Key? key,
      required this.title,
      required this.percent_of_students,
      required this.no_of_quizzes})
      : super(key: key);

  final String title, percent_of_students;

  final int no_of_quizzes;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: defaultPadding),
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: kPrimaryColor),
          borderRadius: BorderRadius.all(
            Radius.circular(defaultPadding),
          ),
        ),
        child: Row(
          children: [
            // SizedBox(
            //   height: 20,
            //   width: 20,
            //   child: SvgPicture.asset("assets/images/logo.png"),
            // ),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text("$no_of_quizzes quizzes attempted",
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: kPrimaryColor))
                      ],
                    ))),
            Text(percent_of_students),
          ],
        ));
  }
}
