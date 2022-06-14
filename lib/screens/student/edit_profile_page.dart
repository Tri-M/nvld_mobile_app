import 'package:flutter/material.dart';
import 'package:nvld_app/components/text_container.dart';
import 'package:nvld_app/constants.dart';
import 'package:nvld_app/models/UserModal.dart';
import 'package:nvld_app/utils/user_preferences.dart';
import 'package:nvld_app/widget/appbar_widget.dart';
import 'package:nvld_app/widget/password_widget.dart';
import 'package:nvld_app/widget/phonetext_widget.dart';
import 'package:nvld_app/widget/profile_widget.dart';

import '../../models/user.dart';
import '../../widget/textfield_widget.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  UserData user = UserPreferences.myUser;
  UserModel model = UserModel();
  final duser = FirebaseAuth.instance.currentUser!;
  TextEditingController name = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phonenumber = TextEditingController();

  @override
  void initState() {
    super.initState;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 32,
        ),
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: '/assets/user_icon.JPG',
            isEdit: true,
            onClicked: () async {},
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: name,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: "Name",
                fillColor: Colors.white70),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: dob,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.calendar_month),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: "Dob",
                fillColor: Colors.white70),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: email,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: "Email",
                fillColor: Colors.white70),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: password,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: "Password",
                fillColor: Colors.white70),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: phonenumber,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: "Phone",
                fillColor: Colors.white70),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
              child: TextContainer(
                text: "Save changes",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                presetFontSizes: [18, 16, 14, 12],
              ),
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                onPrimary: kPrimaryLightColor,
                primary: kPrimaryColor,
                padding: EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
              ),
              autofocus: mounted,
              onPressed: () {
                submit();
              },
            ),
          ),
        ],
      ),
    );
  }

  void submit() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user?.uid;
    var collection = FirebaseFirestore.instance.collection('users').doc(uid);

    await collection.get().then((value) {
      Map<String, dynamic>? data = value.data();
      print(data);
      model.name = data!['Name'];
      model.email = data['Email'];
      model.phoneNumber = data['Phonenumber'];
      model.dob = data['Dob'];
      model.password = data['Password'];

      print(model);
    });

    collection.update({
      'Name': name.text == "" ? model.name : name.text,
      'Email': email.text == "" ? model.email : email.text,
      'Phonenumber':
          phonenumber.text == "" ? model.phoneNumber : phonenumber.text,
      'Dob': dob.text == "" ? model.dob : dob.text,
      'Password': password.text == "" ? model.password : password.text,
    });
  }
}
