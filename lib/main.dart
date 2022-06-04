import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nvld_app/Screens/login_screen.dart';
import 'package:nvld_app/Screens/welcome_screen.dart';
import 'package:nvld_app/screens/staff/individual_performance.dart';
import 'package:nvld_app/screens/staff/students_performance.dart';
import 'package:nvld_app/screens/staff/student_invite.dart';
import 'package:nvld_app/screens/staff/upload_question_page.dart';
import 'package:nvld_app/screens/student/edit_profile_page.dart';
import 'package:nvld_app/screens/student/mcq_page.dart';
import 'package:nvld_app/screens/student/student_dashboard.dart';
// import 'package:nvld_app/screens/mcq_page.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //body: McqPage()
        //body: StudentDashboard()
        //body: LoginScreen()
        // body: WelcomeScreen()
        //body: EditProfilePage()
        //body: StudentsPerformance(),
        //body: StudentInviteScreen(),
        body: IndividualPerformance(),
      ),
    );
  }
}
