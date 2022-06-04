import 'package:flutter/material.dart';
import 'package:nvld_app/components/common_layout.dart';
import 'package:nvld_app/constants.dart';
import '../../components/recent_student_performance.dart';

class IndividualPerformance extends StatelessWidget {
  const IndividualPerformance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      backgroundColor: background,
      child: RecentStudentPerformance(),
    );
  }
}
