import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:nvld_app/Screens/login_screen.dart';
import 'package:nvld_app/components/text_field_container.dart';
import 'package:nvld_app/constants.dart';
import 'package:nvld_app/models/Question.dart';
import 'package:nvld_app/models/UserModal.dart';
import 'package:nvld_app/screens/student/student_dashboard.dart';
import 'package:nvld_app/screens/student/test_screen.dart';
import 'package:provider/provider.dart';
import '../provider/user_provider.dart';
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

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _auth = FirebaseAuth.instance;
  late String errorMessage;
  String email = "";
  String password = "";
  String name = "";
  String dob = "";
  String phonenumber = "";
  // final _auth = FirebaseAuth.instance;
  Future<void> getQuestions(int cat) async {
    // print('HI');
      FirebaseFirestore.instance.collection('category$cat').get().then((value) {
        value.docs.forEach((element) {
          Map questionData = element.data();
          // print("Questionsdata :- $questionData");
          List<String> tempOptions = [];
          for (String op in questionData["options"]) {
            tempOptions.add(op);
          }
          // print('ALL FINE TILL HERE');
          Question tempQuestion = Question(
              question: questionData["question"],
              answer: questionData["answer"],
              options: tempOptions,
              type: questionData["type"],
              media: questionData["url"]);
          // print('ALL FINE TILL HERE2');
          Provider.of<UserProvider>(context, listen: false)
              .questions
              .add(tempQuestion);
          
          // print('ALL FINE TILL HERE3');

          // print(tempQuestion);
        });
      });
      // print(Provider.of<UserProvider>(context, listen: false).questions);
    }

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
      userModel.userType = "student";
      userModel.level = 0;
      userModel.staff = "";
      userModel.phoneNumber = phonenumber;
      userModel.password = password;

      await firebaseFirestore
          .collection("users")
          .doc(user.uid)
          .set(userModel.toMap());

      Provider.of<UserProvider>(context, listen: false).addUserData(userModel);

      // print("came");
      Fluttertoast.showToast(msg: "Account created successfully! ");
      getQuestions(1);
      // print('Get Questions done');
      
      Navigator.pushAndRemoveUntil(
          (context),
          MaterialPageRoute(builder: (context) => TestScreen()),
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
              hintText: "Email",
              icon: Icons.mail,
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            RoundedInputField(
              hintText: "Name",
              icon: Icons.account_circle,
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            TextFieldContainer(
              child: TextField(
                cursorColor: kPrimaryColor,
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.calendar_month,
                    color: kPrimaryColor,
                  ),
                  hintText: "Date of Birth",
                  border: InputBorder.none,
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    setState(() {
                      dob = formattedDate;
                    });
                  }
                },
              ),
            ),
            RoundedInputField(
              hintText: "Phone Number",
              icon: Icons.phone,
              onChanged: (value) {
                setState(() {
                  phonenumber = value;
                });
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
