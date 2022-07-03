import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nvld_app/components/background_login.dart';
import 'package:nvld_app/components/rounded_button.dart';
import 'package:nvld_app/components/rounded_input_field.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    late String email = "";

    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // SvgPicture
              Text(
                "Forget Password",
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

              RoundedButton(
                text: "Reset Password",
                press: () {
                  resetpassword(email);
                },
              ),
              RoundedButton(
                text: "Back to login",
                color: Colors.grey,
                press: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future resetpassword(String email) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Fluttertoast.showToast(msg: "Password reset email send");
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      print(e);
      Fluttertoast.showToast(msg: e.message.toString());
      Navigator.of(context).pop();
    }
  }
}
