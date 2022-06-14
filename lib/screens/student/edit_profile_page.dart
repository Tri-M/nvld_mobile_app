import 'package:flutter/material.dart';
import 'package:nvld_app/components/text_container.dart';
import 'package:nvld_app/constants.dart';
import 'package:nvld_app/models/UserModal.dart';
import 'package:nvld_app/provider/user_provider.dart';
import 'package:nvld_app/widget/appbar_widget.dart';
import 'package:nvld_app/widget/password_widget.dart';
import 'package:nvld_app/widget/phonetext_widget.dart';
import 'package:nvld_app/widget/profile_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nvld_app/widget/textfield_widget.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final fuser = FirebaseAuth.instance.currentUser!;
  late String name = fuser.email!;
  late String dob = "";
  late String email = "";
  late String password = "";
  late String phonenumber = "";
  void getfunction() async {
    var collection = FirebaseFirestore.instance.collection('users');
    late Iterator<QueryDocumentSnapshot<Object?>> objiter;

    await FirebaseFirestore.instance
        .collection("users")
        .where("Email", isEqualTo: fuser.email)
        .get()
        .then((QuerySnapshot snapshot) {
      objiter = snapshot.docs.iterator;
    });
    while (objiter.moveNext()) {
      name = objiter.current.get("Name");
      dob = objiter.current.get("Dob");
      email = objiter.current.get("Email");
      password = objiter.current.get("Password");
      phonenumber = objiter.current.get("Phonenumber");
    }
  }

  @override
  Widget build(BuildContext context) {
    UserModel myUser = Provider.of<UserProvider>(context).myUser;
    final fuser = FirebaseAuth.instance.currentUser;
    void getfunction() async {
      var collection = FirebaseFirestore.instance.collection('users');
      late Iterator<QueryDocumentSnapshot<Object?>> objiter;

      await FirebaseFirestore.instance
          .collection("users")
          .where("Email", isEqualTo: fuser?.email)
          .get()
          .then((QuerySnapshot snapshot) {
        objiter = snapshot.docs.iterator;
      });

      while (objiter.moveNext()) {
        name = objiter.current.get("Name");
        dob = objiter.current.get("Dob");
        email = objiter.current.get("Email");
        password = objiter.current.get("Password");
        phonenumber = objiter.current.get("Phonenumber");
      }
    }

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
            text: myUser.name!,
            onChanged: (name) {},
          ),
          SizedBox(
            height: 20,
          ),
          TextFieldWidget(
            label: 'Dob',
            icon: const Icon(
              Icons.cake,
            ),
            text: myUser.name!,
            onChanged: (Name) {},
          ),
          SizedBox(
            height: 20,
          ),
          TextFieldWidget(
            label: 'Email',
            icon: const Icon(Icons.email),
            text: myUser.email!,
            onChanged: (name) {},
          ),
          SizedBox(
            height: 20,
          ),
          PasswordWidget(
            icon: const Icon(Icons.lock),
            label: 'Password',
            text: myUser.name!,
            onChanged: (name) {},
          ),
          SizedBox(
            height: 20,
          ),
          PhoneTextWidget(
            icon: const Icon(Icons.phone),
            label: 'Phone',
            text: myUser.name!,
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
