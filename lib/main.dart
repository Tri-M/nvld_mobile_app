import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nvld_app/Screens/login_screen.dart';
import 'package:nvld_app/Screens/welcome_screen.dart';
import 'package:nvld_app/provider/user_provider.dart';
import 'package:nvld_app/screens/staff/individual_performance.dart';
import 'package:nvld_app/screens/staff/upload_question_page.dart';
import 'package:nvld_app/screens/student/edit_profile_page.dart';
import 'package:nvld_app/screens/student/mcq_page.dart';
import 'package:nvld_app/screens/student/student_dashboard.dart';
import 'package:nvld_app/screens/student/test_screen.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'models/user.dart';
// import 'package:nvld_app/screens/mcq_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
      //     DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) => MyApp(), // Wrap your app
      // ));
      MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
          theme: ThemeData(),
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              // body:StudentDashboard(),
              body: WelcomeScreen())
          //IndividualPerformance()),
          ),
    );
  }
}
//bfgn