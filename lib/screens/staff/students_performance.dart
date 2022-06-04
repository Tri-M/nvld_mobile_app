import 'package:flutter/material.dart';
import 'package:nvld_app/components/common_layout.dart';
import 'package:nvld_app/components/text_container.dart';
import 'package:nvld_app/constants.dart';

class StudentsPerformance extends StatelessWidget {
  const StudentsPerformance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final List students = [
      ['max', 'level-2'],
      ['john', 'level-1'],
      ['max', 'level-2'],
      ['john', 'level-1'],
      ['max', 'level-2'],
      ['john', 'level-1'],
      ['max', 'level-2'],
      ['john', 'level-1'],
      ['max', 'level-2'],
      ['john', 'level-1'],
    ];

    return CommonLayout(
      backgroundColor: background,
      child: Column(
        children: [
          Container(
            color: kPrimaryColor,
            padding: EdgeInsets.only(top: height * 0.02, bottom: height * 0.02),
            width: width,
            child: TextContainer(
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              text: "My Students Performances",
              presetFontSizes: [20, 18, 16, 14, 12, 10, 8, 6],
              width: width * 0.1,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(
                            top: height * 0.005, bottom: height * 0.005),
                        child: InkWell(
                          onTap: () {},
                          child: ListTile(
                            tileColor: background,
                            title: TextContainer(
                              text: students[index][0],
                              presetFontSizes: [20, 18, 16, 14, 12],
                              width: width * 0.1,
                            ),
                            subtitle: TextContainer(
                              text: students[index][1],
                              presetFontSizes: [14, 12, 10, 8, 6, 4],
                              width: width * 0.1,
                            ),
                          ),
                        )),
                    const Divider(
                      height: 0,
                      thickness: 0.5,
                      indent: 10,
                      endIndent: 10,
                      color: Colors.grey,
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
