import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class RecentPerformance {
  final String? title, date, marks;
  final Widget? icon;

  RecentPerformance({this.icon, this.title, this.date, required this.marks});
}

List demoData = [
  RecentPerformance(
      icon: SvgPicture.asset("assets/icons/user.svg"),
      title: "John",
      date: "01-01-2022",
      marks: "45%"),
  RecentPerformance(
      icon: SvgPicture.asset("assets/icons/user.svg"),
      title: "John",
      date: "01-01-2022",
      marks: "45%"),
  RecentPerformance(
      icon: SvgPicture.asset("assets/icons/user.svg"),
      title: "John",
      date: "01-01-2022",
      marks: "45%"),
  RecentPerformance(
      icon: SvgPicture.asset("assets/icons/user.svg"),
      title: "John",
      date: "01-01-2022",
      marks: "45%"),
];
