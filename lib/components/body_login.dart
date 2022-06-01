import 'package:flutter/material.dart';
import 'package:nvld_app/screens/student/student_dashboard.dart';
import './background_login.dart';
import 'package:nvld_app/screens/signup_screen.dart';
import 'package:nvld_app/components/account_check.dart';
import 'package:nvld_app/components/rounded_button.dart';
import 'package:nvld_app/components/rounded_input_field.dart';
import 'package:nvld_app/components/rounded_password_field.dart';
// import 'package:flutter_svg/flutter_svg.dart';
class Body extends StatelessWidget {
  

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
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push((context),MaterialPageRoute(builder: (context) => StudentDashboard()));
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login:true,
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
