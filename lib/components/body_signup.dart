import 'package:flutter/material.dart';
import 'package:nvld_app/Screens/login_screen.dart';
import './background_signup.dart';
import 'package:nvld_app/components/account_check.dart';
import 'package:nvld_app/components/rounded_button.dart';
import 'package:nvld_app/components/rounded_input_field.dart';
import 'package:nvld_app/components/rounded_password_field.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:nvld_app/components/date_of_birth.dart';

class Body extends StatelessWidget {
  //final _auth = FirebaseAuth.instance;
  //final _auth = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
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
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Your Name",
              onChanged: (value) {},
            ),
            DOBField(
              hintText: "Date of Birth",
              onChanged: (value) {},
            ),
            SizedBox(height: size.height * 0.03),
            RoundedButton(
              text: "SIGNUP",
              press: () {},
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
