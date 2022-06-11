import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:nvld_app/screens/student/mcq_page.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: mainPage(),
    );
  }
}

class mainPage extends StatefulWidget {
  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Image.asset(
            "assets/welcome.jpg",
            scale: 5,
          ),
        ),
        titleWidget: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            "Welcome Student!",
            style: TextStyle(fontSize: 30),
          ),
        ),
        body: "Can you give a try?",
      ),
      PageViewModel(
          image: Column(
            children: [
              const SizedBox(height: 50),
              Image.asset(
                "assets/allthebest.jpg",
                width: 300,
                height: 180,
              ),
            ],
          ),
          titleWidget: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              "Give it a Try",
              style: TextStyle(fontSize: 25),
            ),
          ),
          bodyWidget: Column(
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => McqPage()));
                },
                icon: Icon(Icons.play_arrow, size: 18),
                label: Text("Attempt Quiz"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                ),
              )
            ],
          )),
    ];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Introduction Screen"),
      //   backgroundColor: Colors.deepPurple,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IntroductionScreen(
          globalBackgroundColor: Colors.white,
          pages: getPages(),
          showNextButton: false,
          showSkipButton: true,
          skip: Text("Next"),
          done: Text("Attempt "),
          onDone: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => McqPage()));
          },
        ),
      ),
    );
  }
}
