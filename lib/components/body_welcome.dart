import 'package:flutter/material.dart';
import 'package:nvld_app/Screens/login_screen.dart';
import 'package:nvld_app/Screens/signup_screen.dart';
import 'package:provider/provider.dart';
import '../provider/user_provider.dart';
import './background_welcome.dart';
import 'package:nvld_app/components/rounded_button.dart';
import 'package:nvld_app/constants.dart';
// import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              Provider.of<UserProvider>(context, listen: true).logoUrl,
              height: size.height * 0.25,
              width: size.width / 1.2,
            ),
            Text(
              "NVLD QUIZ APP",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  foreground: Paint()
                    ..style = PaintingStyle.fill
                    ..strokeWidth = 6
                    ..color = Color.fromARGB(255, 133, 25, 210)),
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "LOGIN",
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
            RoundedButton(
              text: "SIGNUP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
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
            const SizedBox(
              height: 30,
            ),
            Text('Powered By'),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Black Board Learning',
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
