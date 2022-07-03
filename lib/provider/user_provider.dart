import 'package:flutter/material.dart';

import '../models/Question.dart';
import '../models/UserModal.dart';

class UserProvider extends ChangeNotifier{
  late UserModel myUser;
  String logoUrl="";
  List<Question> welcomeQuestions=[];
  List<Question> questions=[
    // Question(
    //   question: 'How many players are there in a cricket team?',
    //   options: ['11', '12', '13', '14'],
    //   answer: 1,
    //   type: "image",
    //   media:'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png'
    // ),
    // Question(
    //   question: 'Who is the captain of indian cricket team? ',
    //   options: ['MS Dhoni what a great player one of the best of all time', 'Virat Kohli', 'Rohit Sharma', 'Bhumra'],
    //   answer: 3,
    //   type: "video",
    //   media:"https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"
    // ),
    
    // Question(
    //   question: 'How many Bowlers are there in a cricket team?',
    //   options: ['2', '12', '3', '4'],
    //   answer: 1,
    //   type: "text",
    //   media:''
    // ),
    // Question(
    //   question: 'How m'
    // ),
    
  ];
  


  void addUserData(UserModel user){
    myUser=user;
    notifyListeners();
  }

  void logout(){
    myUser=UserModel();
    questions=[];
    welcomeQuestions=[];
    notifyListeners();
  }
  // void calculateScore(){
  //   for (Question q in questions){
  //     print('q.selected: ${q.selected}');
  //     print('q.answer: ${q.answer}');
  //     if (q.selected == q.answer)
  //       score++;
  //   }
  //   // print(score);
  // }
}