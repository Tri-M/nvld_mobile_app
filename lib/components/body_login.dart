import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nvld_app/screens/staff/staff_dashboard.dart';
import 'package:nvld_app/screens/student/student_dashboard.dart';
import 'package:nvld_app/screens/student/test_screen.dart';
import 'package:provider/provider.dart';
import '../models/UserModal.dart';
import '../models/user.dart';
import '../provider/user_provider.dart';
import '../screens/admin/admin.dart';
import './background_login.dart';
import 'package:nvld_app/screens/signup_screen.dart';
import 'package:nvld_app/components/account_check.dart';
import 'package:nvld_app/components/rounded_button.dart';
import 'package:nvld_app/components/rounded_input_field.dart';
import 'package:nvld_app/components/rounded_password_field.dart';

// import 'package:flutter_svg/flutter_svg.dart';
class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _auth = FirebaseAuth.instance;

  late String email = "";

  late String password = "";

  late String errorMessage;

  Future<void> _getUserName(String uid) async {
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      Map<String, dynamic>? data = value.data();
      print(data);

      Provider.of<UserProvider>(context, listen: false).addUserData(UserModel(
          name: data!['Name'],
          email: data['Email'],
          phoneNumber: data['Phone'],
          dob: data['Dob'],
          userType: data['UserType'],
          level: data['Level']));
      if (data['UserType'] == 'student') {
        print(data['Level']);
        if (data['Level'] == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TestScreen(),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StudentDashboard(),
            ),
          );
        }
      } else if (data['UserType'] == 'staff') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StaffDashboardScreen(),
          ),
        );
      } else if (data['UserType'] == 'admin') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Admin(),
          ),
        );
      }
      // print(myUser.name);
      // _userName = value.data['UserName'].toString();
    });
  }
  
  void signIn(String email, String password) async {
    try {
      UserCredential userCred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      _getUserName(userCred.user!.uid);
      // print('THIS IS USER');

      // .then((uid) => {
      //       Fluttertoast.showToast(msg: "Login Successful"),
      //       Navigator.of(context).pushReplacement(MaterialPageRoute(
      //           builder: (context) => const StudentDashboard())),
      //     });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";

          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(msg: errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // SvgPicture
            Text(
              "LOGIN",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  foreground: Paint()
                    ..style = PaintingStyle.fill
                    ..strokeWidth = 6
                    ..color = Color.fromARGB(255, 133, 25, 210)),
            ),
            SizedBox(height: size.height * 0.03),
            // SvgPicture.asset(
            //   "assets/icons/login.svg",
            //   height: size.height * 0.25,
            // ),
            SizedBox(height: size.height * 0.03),

            RoundedInputField(
              hintText: "Email",
              icon: Icons.mail,
              onChanged: (value) {
                email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                password = value;
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                signIn(email, password);
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: true,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
