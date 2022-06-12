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
  late String name = "";
  late String dob = "";
  late String email = "";
  late String password = "";
  late String phonenumber = "";

  @override
  void initState() {
    super.initState;
    getfunction();
  }

  void getfunction() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user?.uid;
    var collection = FirebaseFirestore.instance.collection('users');

    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      Map<String, dynamic>? data = value.data();
      print(data);
      model.name = data!['Name'];
      model.email = data['Email'];
      model.phoneNumber = data['Phone'];
      model.dob = data['Dob'];
      model.password = data['Password'];

      print(model);
    });
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
            imagePath: '/assets/images/profile.png',
            isEdit: true,
            onClicked: () async {},
          ),
          SizedBox(
            height: 20,
          ),
          TextFieldWidget(
            label: 'Name',
            icon: const Icon(Icons.person),
            text: name,
            onChanged: (Name) {
              print(name);
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextFieldWidget(
            label: 'Dob',
            icon: const Icon(Icons.person),
            text: dob,
            onChanged: (Name) {},
          ),
          SizedBox(
            height: 20,
          ),
          TextFieldWidget(
            label: 'Email',
            icon: const Icon(Icons.email),
            text: email,
            onChanged: (name) {},
          ),
          SizedBox(
            height: 20,
          ),
          PasswordWidget(
            icon: const Icon(Icons.lock),
            label: 'Password',
            text: password,
            onChanged: (name) {},
          ),
          SizedBox(
            height: 20,
          ),
          PhoneTextWidget(
            icon: const Icon(Icons.phone),
            label: 'Phone',
            text: phonenumber,
            onChanged: (name) {},
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
                getfunction();
              },
            ),
          ),
        ],
      ),
    );
  }
}
