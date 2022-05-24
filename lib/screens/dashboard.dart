import 'package:flutter/material.dart';
import '/components/text_container.dart';
import './profile_screen.dart';
import './student_dashboard_drawer.dart';
import 'package:nvld_app/components/performance _graph.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
          child: const Icon(
            Icons.person,
            size: 26,
          ),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: height * 0.75,
            width: width * 0.85,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: height * 0.035,
                          bottom: height * 0.03,
                          left: width * 0.06),
                      alignment: Alignment.topLeft,
                      child: TextContainer(
                        text: "Hello user!",
                        presetFontSizes: const [24, 22, 20, 18, 16],
                        textAlign: TextAlign.left,
                        width: width * 0.6,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextContainer(
                      text: "Level 3",
                      presetFontSizes: [20, 18, 16, 14],
                    )
                  ],
                ),
                Card(
                  elevation: height * 0.03,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    child: PerformanceGraph(),
                    height: height * 0.2,
                    width: width * 0.75,
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
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: width * 0.01,
                          blurRadius: 4,
                          offset: const Offset(0, 3),
                        ),
                      ],
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextContainer(
                                  text: "Recent Score",
                                  presetFontSizes: [18, 16, 14, 12],
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextContainer(
                                  text: "13/15",
                                  presetFontSizes: [20, 18, 16, 14, 12],
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          height: width * 0.36,
                          width: width * 0.36,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(213, 213, 213, 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      Card(
                        elevation: height * 0.03,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextContainer(
                                  text: "Best Score",
                                  presetFontSizes: [18, 16, 14, 12],
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextContainer(
                                  text: "14/15",
                                  presetFontSizes: [20, 18, 16, 14, 12],
                                  style: TextStyle(fontWeight: FontWeight.bold))
                            ],
                          ),
                          height: width * 0.36,
                          width: width * 0.36,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(213, 213, 213, 1),
                            borderRadius: BorderRadius.circular(15),
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
                    onPressed: () {},
                    child: Image.asset('./assets/images/play.png'),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      // primary: const Color.fromRGBO(118, 72, 216, 1),
                      onPrimary: Colors.purple,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
