import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nvld_app/components/common_layout.dart';
import 'package:nvld_app/components/rounded_input_field.dart';
import 'package:nvld_app/components/text_container.dart';
import 'package:nvld_app/models/ScoreModal.dart';
import 'package:nvld_app/models/UserModal.dart';
import 'package:nvld_app/provider/user_provider.dart';
import 'package:nvld_app/utils/user_preferences.dart';
import 'package:provider/provider.dart';
import '../../models/to_student.dart';
import '../../constants.dart';

class StudentInviteScreen extends StatelessWidget {
  StudentInviteScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController();

  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    UserModel myUser = Provider.of<UserProvider>(context).myUser;

    return CommonLayout(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(118, 72, 216, 1),
          elevation: 0,
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.05, horizontal: width * 0.05),
              child: Column(
                children: [
                  TextContainer(
                    text: "Enter the student mail",
                    presetFontSizes: [18, 16, 14, 12, 10],
                    width: width,
                  ),
                  TextFormField(
                      cursorColor: kPrimaryColor,
                      controller: emailEditingController,
                      onSaved: (value) {
                        emailEditingController.text = value!;
                      },

                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      }),
                  SizedBox(height: 30),
                  TextContainer(
                    text: "Enter a password for mail",
                    presetFontSizes: [18, 16, 14, 12, 10],
                    width: width,
                  ),
                  TextFormField(
                    // The validator receives the text that the user has entered.
                    controller: passwordEditingController,
                    obscureText: true,

                    onSaved: (value) {
                      passwordEditingController.text = value!;
                    },

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.08),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: kPrimaryColor,
                        shape: StadiumBorder(),
                      ),
                      onPressed: () {
                        FirebaseFirestore firebaseFirestore =
                            FirebaseFirestore.instance;
                        User? user = _auth.currentUser;
                        create(emailEditingController.text,
                            passwordEditingController.text, user?.email);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: TextContainer(
                          textAlign: TextAlign.center,
                          text: 'Submit',
                          presetFontSizes: [16, 14, 12, 10],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  final _auth = FirebaseAuth.instance;

  void create(String email, String password, String? staffmail) async {
    late String errorMessage;
    try {
      UserCredential userCred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print('this is user ID : ${userCred.user!.uid}');
      postDetailsToFirestore(userCred.user!.uid, staffmail);
      //     .then((value) => {postDetailsToFirestore()})
      //     .catchError((e) {
      //   Fluttertoast.showToast(msg: e!.message);
      // });
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

  void postDetailsToFirestore(String uid, String? staffmail) async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();
    ScoreModel scoreModel = ScoreModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = "";
    userModel.dob = "";
    userModel.userType = "student";
    userModel.level = 0;
    userModel.staff = staffmail;
    userModel.password = passwordEditingController.text;

    await firebaseFirestore.collection("users").doc(uid).set(userModel.toMap());

    scoreModel.email = user.email;
    scoreModel.uid = user.uid;
    scoreModel.score = [];

    await firebaseFirestore
        .collection("scores")
        .doc(uid)
        .set(scoreModel.toMap());

    print("came");
    Fluttertoast.showToast(msg: "Account created successfully! ");
  }
}
