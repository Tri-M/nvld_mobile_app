import 'package:flutter/material.dart';
import 'package:nvld_app/Screens/login_screen.dart';
import 'package:nvld_app/Screens/signup_screen.dart';
import 'package:nvld_app/controllers/drawer_control.dart';
import 'package:nvld_app/screens/admin/admin.dart';
import 'package:nvld_app/screens/staff/staff_main_screen.dart';
import 'package:provider/provider.dart';
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
            Text(
              "QUIZ APP",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  foreground: Paint()
                    ..style = PaintingStyle.fill
                    ..strokeWidth = 6
                    ..color = Color.fromARGB(255, 133, 25, 210)),
            ),
            SizedBox(height: size.height * 0.05),
            // SvgPicture.asset(
            //   "assets/icons/homepageicon.svg",
            //   height: size.height * 0.25,
            // ),
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
              text: "STAFF LOGIN",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MultiProvider(
                        providers: [
                          ChangeNotifierProvider(
                            create: (context) => DrawerControl(),
                          ),
                        ],
                        child: StaffMainScreen(),
                      );
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "Admin",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Admin();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
