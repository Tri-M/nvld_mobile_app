import 'package:flutter/material.dart';
import 'package:nvld_app/components/header.dart';
import 'package:nvld_app/components/my_students.dart';
import 'package:nvld_app/components/student_details.dart';
import 'package:nvld_app/constants.dart';
import 'package:nvld_app/screens/staff/responsiveness.dart';
import 'package:nvld_app/screens/staff/staff_dashboard_drawer.dart';
import 'package:nvld_app/screens/student/profile_page.dart';
import 'package:provider/provider.dart';

import '../../provider/user_provider.dart';

class StaffDashboardScreen extends StatelessWidget {
  const StaffDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        drawer: StaffDashboardDrawer(),
        appBar: AppBar(
          toolbarHeight: height * 0.1,
          elevation: 0,
          flexibleSpace: Image(
            image: NetworkImage(
              Provider.of<UserProvider>(context, listen: true).logoUrl,
            ),
          ),
          backgroundColor: Colors.deepPurple,
          title: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: width * 0.006),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: const CircleBorder(),
                padding: EdgeInsets.all(width * 0.005),
              ),
              child: Icon(
                Icons.person,
                size: height * 0.04,
                color: Colors.deepPurple,
              ),
              onPressed: () {},
            ),
          ),
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              color: Color.fromARGB(255, 145, 96, 252),
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
                            ],
                          ),
                        ),
                        if (!Responsiveness.isMobile(context))
                          SizedBox(width: defaultPadding),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
