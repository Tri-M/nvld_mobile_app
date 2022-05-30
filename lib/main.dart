import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/Welcome/welcome_screen.dart';
import 'package:quiz_app/constants.dart';
import 'package:firebase_core/firebase_core.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Color.fromARGB(255, 250, 248, 248),
      ),
      home: WelcomeScreen(),
    );
  }
}
