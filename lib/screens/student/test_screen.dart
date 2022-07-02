import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:nvld_app/screens/student/mcq_page.dart';
import 'package:provider/provider.dart';

import '../../models/Question.dart';
import '../../provider/user_provider.dart';

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
  final _auth = FirebaseAuth.instance;
  @override
  initState(){
    super.initState();
    print(Provider.of<UserProvider>(context,listen:false).myUser);
    getQuestions(1);
  }
  Future<void> getQuestions(int cat) async {
    // print('HI');
      await FirebaseFirestore.instance.collection('category$cat').get().then((value) {
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

          print(tempQuestion);
        });
      });
      // print(Provider.of<UserProvider>(context, listen: false).questions);
    }
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
                  print('this is questions');
                  print(Provider.of<UserProvider>(context,listen:false).questions);
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
            print(Provider.of<UserProvider>(context,listen:false).questions);
            Navigator.push(

                context, MaterialPageRoute(builder: (context) => McqPage()));
          },
        ),
      ),
    );
  }
}
