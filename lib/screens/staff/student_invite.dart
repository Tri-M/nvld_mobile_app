import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:nvld_app/components/text_container.dart';
import 'package:nvld_app/components/text_field_container.dart';
import 'package:nvld_app/constants.dart';
import 'package:nvld_app/models/UserModal.dart';
import 'package:nvld_app/screens/admin/admin.dart';
import 'package:http/http.dart' as http;
import 'package:slidable_button/slidable_button.dart';

final dob = TextEditingController();

class Staff_addstud extends StatefulWidget {
  String? staffmail;
  Staff_addstud({Key? key, required this.staffmail}) : super(key: key);

  @override
  State<Staff_addstud> createState() => _Staff_addstudState(staffmail);
}

class _Staff_addstudState extends State<Staff_addstud> {
  final _formKey = GlobalKey<FormState>();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  bool slide = false;
  late String? staffmail;
  _Staff_addstudState(String? staffmail) {
    this.staffmail = staffmail;
  }

  Future sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    final serviceId = 'service_px2ny82';
    final templateId = 'template_tnnh6vu';
    final userId = 'hmFFOdBu4fKyItB0_';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json'
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name': name,
          'user_email': 'abishek20030324@gmail.com',
          'to_email': email,
          'user_subject': subject,
          'user_message': message,
        }
      }),
    );
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: height * 0.1,
          elevation: 0,
          backgroundColor: const Color.fromRGBO(118, 72, 216, 1),
          title: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: width * 0.006),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: const CircleBorder(),
                padding: EdgeInsets.all(width * 0.005),
              ),
              child: Icon(
                Icons.person,
                size: height * 0.04,
                color: const Color.fromRGBO(88, 57, 178, 1),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Admin(),
                  ),
                );
              },
            ),
          ),
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextContainer(
                      text: "Enter the student mail",
                      presetFontSizes: [18, 16, 14, 12, 10],
                      width: width,
                    ),
                    TextFormField(
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
                    const SizedBox(
                      height: 30,
                    ),
                    TextContainer(
                      text: "Enter DOB of student (yyyy-mm-dd)",
                      presetFontSizes: [18, 16, 14, 12, 10],
                      width: width,
                    ),
                    TextFormField(
                      controller: dob,
                      onSaved: (value) {
                        dob.text = value!;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: HorizontalSlidableButton(
                        width: MediaQuery.of(context).size.width / 3,
                        buttonWidth: 60.0,
                        color: Theme.of(context).accentColor.withOpacity(0.5),
                        buttonColor: Theme.of(context).primaryColor,
                        dismissible: false,
                        label: Center(
                            child: Text(
                          'Slide',
                          style: TextStyle(color: Colors.white),
                        )),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Don't"),
                              Text('Notify'),
                            ],
                          ),
                        ),
                        onChanged: (position) {
                          setState(() {
                            if (position == SlidableButtonPosition.end) {
                              slide = true;
                            } else {
                              slide = false;
                            }
                            print(slide);
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          FirebaseFirestore firebaseFirestore =
                              FirebaseFirestore.instance;
                          User? user = _auth.currentUser;
                          create(emailEditingController.text,
                              passwordEditingController.text, dob.text);

                          print(slide);

                          if (slide) {
                            sendEmail(
                                name: 'BlackBoard Learning',
                                email: emailEditingController.text,
                                subject: 'Student Role',
                                message:
                                    'Welcome, You are invited to BlackBoard learning \npassword :${passwordEditingController.text}');
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  final _auth = FirebaseAuth.instance;

  void create(String email, String password, String dob) async {
    late String errorMessage;
    try {
      UserCredential userCred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      print('this is user ID : ${userCred.user!.uid}');
      postDetailsToFirestore(userCred.user!.uid);
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

  void postDetailsToFirestore(String uid) async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = user.email!.split("@")[0];
    userModel.dob = dob.text;
    userModel.userType = "student";
    userModel.level = 0;
    userModel.staff = staffmail;
    userModel.password = passwordEditingController.text;
    userModel.phoneNumber = "";

    await firebaseFirestore.collection("users").doc(uid).set(userModel.toMap());

    print("came");
    Fluttertoast.showToast(msg: "Account created successfully! ");
  }
}
