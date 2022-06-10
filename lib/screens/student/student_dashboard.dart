import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nvld_app/components/common_layout.dart';
import 'package:nvld_app/screens/student/edit_profile_page.dart';
import 'package:nvld_app/screens/student/mcq_page.dart';
import 'package:provider/provider.dart';
import '../../models/Question.dart';
import '../../models/UserModal.dart';
import '../../provider/user_provider.dart';
import '/components/text_container.dart';
import 'profile_page.dart';
import 'student_dashboard_drawer.dart';
import '../../components/performance _graph.dart';
import '../../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StudentDashboard extends StatefulWidget {
  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  @override
  Widget build(BuildContext context) {
    UserModel myUser = Provider.of<UserProvider>(context).myUser;
    // Provider.of<UserProvider>(context).calculateScore();
    List<Question> questions = Provider.of<UserProvider>(context).questions;
    int qLen = questions.length;
    int score = 0;
    for (int i = 0; i < qLen; i++) {
      if (questions[i].answer == questions[i].selected) {
        score++;
      }
    }
    print('THIS IS SCORE ${score}');

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(118, 72, 216, 1),
          drawer: StudentDashboardDrawer(),
          appBar: AppBar(
            toolbarHeight: height * 0.07,
            elevation: 0,
            flexibleSpace: Image(
              image: NetworkImage(
                Provider.of<UserProvider>(context, listen: true).logoUrl,
              ),
            ),
            backgroundColor: Color.fromRGBO(88, 57, 178, 1),
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
                      builder: (context) => ProfilePage(),
                    ),
                  );
                },
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.02),
              child: Container(
                alignment: Alignment.center,
                child: Container(
                  height: height * 0.75,
                  width: width * 0.85,
                  // padding:EdgeInsets.symmetric(vertical:height*0.02),
                  decoration: BoxDecoration(
                    color: background,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              top: height * 0.035,
                              bottom: height * 0.03,
                              left: width * 0.06,
                            ),
                            alignment: Alignment.topLeft,
                            child: TextContainer(
                              text: "Hello ${myUser.name}",
                              presetFontSizes: const [24, 22, 20, 18, 16],
                              width: width * 0.7,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 3),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              top: height * 0.035,
                              bottom: height * 0.03,
                              right: width * 0.06,
                            ),
                            // child: TextContainer(
                            //   text: "Level 3",
                            //   presetFontSizes: const [20, 18, 16, 14, 12],
                            //   style: TextStyle(fontSize: 2),
                            // ),
                          ),
                        ],
                      ),
                      Card(
                        elevation: height * 0.03,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          height: height * 0.2,
                          width: width * 0.75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey[100],
                          ),
                          child: Container(
                            padding: EdgeInsets.only(
                              top: height * 0.01,
                              bottom: height * 0.01,
                              right: width * 0.06,
                              left: width * 0.02,
                            ),
                            child: PerformanceGraph(),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(width * 0.025),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Card(
                              elevation: height * 0.03,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Container(
                                height: width * 0.3,
                                width: width * 0.3,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color.fromRGBO(159, 108, 242, 1),
                                      Color.fromRGBO(88, 57, 178, 1),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextContainer(
                                      text: "Best Score",
                                      width: width * 0.25,
                                      presetFontSizes: [22, 20, 18, 16, 14, 12],
                                      textAlign: TextAlign.center,
                                      maxlines: 1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    TextContainer(
                                        text: "$score/$qLen",
                                        textAlign: TextAlign.center,
                                        width: width * 0.2,
                                        presetFontSizes: [20, 18, 16, 14, 12],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white))
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              elevation: height * 0.03,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Container(
                                height: width * 0.3,
                                width: width * 0.3,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color.fromRGBO(159, 108, 242, 1),
                                      Color.fromRGBO(88, 57, 178, 1),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextContainer(
                                      text: "Best Score",
                                      width: width * 0.25,
                                      presetFontSizes: [22, 20, 18, 16, 14, 12],
                                      textAlign: TextAlign.center,
                                      maxlines: 1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    TextContainer(
                                        text: "$score/$qLen",
                                        textAlign: TextAlign.center,
                                        width: width * 0.2,
                                        presetFontSizes: [20, 18, 16, 14, 12],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: (height * 0.03),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromRGBO(88, 57, 178, 1),
                            shape: const CircleBorder(),
                            padding: EdgeInsets.all(width * 0.05),
                          ),
                          child: const Icon(
                            Icons.play_arrow,
                            size: 50,
                          ),
                          onPressed: () {
                            Navigator.push(
                                    (context),
                                    MaterialPageRoute(
                                        builder: (context) => McqPage()))
                                .then((value) => setState(() {}));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
