import "package:flutter/material.dart";

import 'package:flutter_svg/flutter_svg.dart';
import 'package:nvld_app/constants.dart';

class StudentInfo {
  final String? title, totalStudents;
  final Widget? svgSrc;
  final int? no_of_students, percentage;
  final Color? color;

  StudentInfo({
    this.svgSrc,
    this.title,
    this.totalStudents,
    this.no_of_students,
    this.percentage,
    this.color,
  });
}

List myStudents = [
  StudentInfo(
      title: "5-7 years",
      no_of_students: 23,
      svgSrc: SvgPicture.network("assets/icons/user.svg"),
      totalStudents: "50",
      color: kPrimaryColor,
      percentage: 35),
  StudentInfo(
      title: "8-10 years",
      no_of_students: 23,
      svgSrc: SvgPicture.network("assets/icons/user.svg"),
      totalStudents: "",
      color: kPrimaryColor,
      percentage: 35),
  StudentInfo(
      title: "11-13 years",
      no_of_students: 23,
      svgSrc: SvgPicture.network("assets/icons/user.svg"),
      totalStudents: "",
      color: kPrimaryColor,
      percentage: 35),
];
