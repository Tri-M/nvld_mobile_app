import 'package:flutter/material.dart';
import 'package:nvld_app/components/header.dart';
import 'package:nvld_app/components/my_students.dart';
import 'package:nvld_app/components/student_details.dart';
import 'package:nvld_app/constants.dart';
import 'package:nvld_app/screens/staff/responsiveness.dart';

class StaffDashboardScreen extends StatelessWidget {
  const StaffDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Image(
            image: AssetImage('assets/logo.jpeg'),
            fit: BoxFit.fitHeight,
          ),
        ),
        body: Container(
          color: Colors.deepPurple,
          child: SingleChildScrollView(
            primary: false,
            padding: EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                // Header(),
                SizedBox(height: defaultPadding),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          MyStudents(),
                          SizedBox(height: defaultPadding),
                          if (Responsiveness.isMobile(context))
                            SizedBox(height: defaultPadding),
                          if (Responsiveness.isMobile(context))
                            StudentDetails(),
                        ],
                      ),
                    ),
                    if (!Responsiveness.isMobile(context))
                      SizedBox(width: defaultPadding),
                    if (!Responsiveness.isMobile(context))
                      Expanded(
                        flex: 2,
                        child: StudentDetails(),
                      ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
