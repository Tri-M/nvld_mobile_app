import 'package:flutter/material.dart';
import 'package:nvld_app/screens/student/edit_profile_page.dart';
import 'package:nvld_app/screens/student/mcq_page.dart';
import '/components/text_container.dart';
import 'profile_page.dart';
import 'student_dashboard_drawer.dart';
import '../../components/performance _graph.dart';
import '../../constants.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({Key? key}) : super(key: key);

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(118, 72, 216, 1),
      drawer: StudentDashboardDrawer(),
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
                  builder: (context) => ProfilePage(),
                ),
              );
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height * 0.75,
              width: width * 0.85,
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
                          text: "Hello user!",
                          presetFontSizes: const [24, 22, 20, 18, 16],
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: height * 0.035,
                          bottom: height * 0.03,
                          right: width * 0.06,
                        ),
                        child: TextContainer(
                          text: "Level 3",
                          presetFontSizes: const [20, 18, 16, 14, 12],
                        ),
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
                            height: width * 0.36,
                            width: width * 0.36,
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextContainer(
                                  text: "Recent Score",
                                  presetFontSizes: [18, 16, 14, 12],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                TextContainer(
                                  text: "13/15",
                                  presetFontSizes: [20, 18, 16, 14, 12],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
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
                            height: width * 0.36,
                            width: width * 0.36,
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextContainer(
                                  text: "Best Score",
                                  presetFontSizes: [18, 16, 14, 12],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                TextContainer(
                                    text: "14/15",
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
                        Navigator.push((context),MaterialPageRoute(builder: (context) => McqPage()));
                      },
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
}