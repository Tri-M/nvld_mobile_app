import 'package:flutter/material.dart';

import '../models/UserModal.dart';

class UserProvider extends ChangeNotifier{
  late UserModel myUser;
  
  void addUserData(UserModel user){
    myUser=user;
    notifyListeners();
  }
}