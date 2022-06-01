import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nvld_app/Screens/login_screen.dart';
import 'package:nvld_app/models/UserModal.dart';
import 'package:nvld_app/screens/student/student_dashboard.dart';
import './background_signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nvld_app/components/account_check.dart';
import 'package:nvld_app/components/rounded_button.dart';
import 'package:nvld_app/components/rounded_input_field.dart';
import 'package:nvld_app/components/rounded_password_field.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:nvld_app/components/date_of_birth.dart';

class Body extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  //final _auth = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    late String errorMessage;
    late String email = "";
    late String password = "";
    late String name = "";
    late String dob = "";
    final _auth = FirebaseAuth.instance;

    void postDetailsToFirestore() async {
      // calling our firestore
      // calling our user model
      // sedning these values

      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      User? user = _auth.currentUser;

      UserModel userModel = UserModel();

      // writing all the values
      userModel.email = user!.email;
      userModel.uid = user.uid;
      userModel.name = name;
      userModel.dob = dob;

      await firebaseFirestore
          .collection("users")
          .doc(user.uid)
          .set(userModel.toMap());

      print("came");
      Fluttertoast.showToast(msg: "Account created successfully! ");

      Navigator.pushAndRemoveUntil(
          (context),
          MaterialPageRoute(builder: (context) => const StudentDashboard()),
          (route) => false);
    }

    void signUp(String email, String password) async {
      print(email);
      print(password);
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
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
        print(error.code);
      }
    }

    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGN UP",
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
            //   "assets/icons/signup.svg",
            //   height: size.height * 0.15,
            // ),
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
            RoundedInputField(
              hintText: "Name",
              icon: Icons.account_circle,
              onChanged: (value) {
                name = value;
              },
            ),
            DOBField(
              hintText: "Date of Birth",
              icon: Icons.calendar_month,
              onChanged: (value) {
                dob = value;
              },
            ),
            SizedBox(height: size.height * 0.03),
            RoundedButton(
              text: "SIGNUP",
              press: () {
                signUp(email, password);
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
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
