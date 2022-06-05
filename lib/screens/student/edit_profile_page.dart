import 'package:flutter/material.dart';
import 'package:nvld_app/components/text_container.dart';
import 'package:nvld_app/constants.dart';
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
  final duser = FirebaseAuth.instance.currentUser!;

  void getfunction() async {
    var collection = FirebaseFirestore.instance.collection('users');
    await FirebaseFirestore.instance
        .collection("users")
        .where("Email", isEqualTo: duser.email)
        .get()
        .then((QuerySnapshot snapshot) {
      snapshot.docs.forEach(
        // add data to your list
        (f) => print(f.id),
      );
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
            imagePath: '/assets/user_icon.JPG',
            isEdit: true,
            onClicked: () async {},
          ),
          SizedBox(
            height: 20,
          ),
          TextFieldWidget(
            label: 'Name',
            icon: const Icon(Icons.person),
            text: user.name,
            onChanged: (name) {},
          ),
          SizedBox(
            height: 20,
          ),
          TextFieldWidget(
            label: 'Email',
            icon: const Icon(Icons.email),
            text: duser.email!,
            onChanged: (name) {},
          ),
          SizedBox(
            height: 20,
          ),
          PasswordWidget(
            icon: const Icon(Icons.lock),
            label: 'Password',
            text: user.password,
            onChanged: (name) {},
          ),
          SizedBox(
            height: 20,
          ),
          PhoneTextWidget(
            icon: const Icon(Icons.phone),
            label: 'Phone',
            text: user.phone,
            onChanged: (name) {},
          ),
          SizedBox(
            height: 20,
          ),
          TextFieldWidget(
            icon: const Icon(Icons.edit),
            label: 'About',
            text: user.about,
            maxLines: 4,
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
