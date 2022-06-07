import '../models/recent_student.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';

class RecentStudentPerformance extends StatelessWidget {
  const RecentStudentPerformance({
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
            "Recent Performance",
            style: TextStyle(color: Colors.purple),
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              columnSpacing: defaultPadding,
              minWidth: 600,
              columns: [
                DataColumn(
                  label: Text("Student name",
                      style: TextStyle(color: Colors.purple)),
                ),
                DataColumn(
                  label: Text("Date", style: TextStyle(color: Colors.purple)),
                ),
                DataColumn(
                  label: Text("Score", style: TextStyle(color: Colors.purple)),
                ),
              ],
              rows: List.generate(
                demoData.length,
                (index) => recentFileDataRow(demoData[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(RecentPerformance studentInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            // SvgPicture.asset(
            //   studentInfo.icon!,
            //   height: 30,
            //   width: 30,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(studentInfo.title!),
            ),
          ],
        ),
      ),
      DataCell(Text(studentInfo.date!)),
      DataCell(Text(studentInfo.marks!)),
    ],
  );
}
