import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nvld_app/models/my_students.dart';
import "../../../constants.dart";

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  final StudentInfo info;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.all(defaultPadding * 0.70),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color:
                          Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: SvgPicture.asset("assets/icons/user.svg")),
              Icon(Icons.more_vert, color: Colors.purple)
            ],
          ),
          Text(
            info.title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          ProgressLine(
            color: info.color,
            percentage: info.percentage,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${info.no_of_students} students",
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: kPrimaryColor)),
              Text(
                info.totalStudents!,
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: kPrimaryColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = kPrimaryColor,
    required this.percentage,
  }) : super(key: key);

  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
              color: color!.withOpacity(0.1),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        LayoutBuilder(
            builder: ((context, constraints) => Container(
                  width: constraints.maxWidth * (percentage! / 100),
                  height: 5,
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                )))
      ],
    );
  }
}
