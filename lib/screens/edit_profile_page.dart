import 'package:flutter/material.dart';
import 'package:nvld_app/components/text_container.dart';
import 'package:nvld_app/constants.dart';
import 'package:nvld_app/utils/user_preferences.dart';
import 'package:nvld_app/widget/appbar_widget.dart';
import 'package:nvld_app/widget/profile_widget.dart';

import '../models/user.dart';
import '../widget/textfield_widget.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;

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
            imagePath: user.imagePath,
            isEdit: true,
            onClicked: () async {},
          ),
          SizedBox(
            height: 20,
          ),
          TextFieldWidget(
            label: 'Name',
            text: user.name,
            onChanged: (name) {},
          ),
          SizedBox(
            height: 20,
          ),
          TextFieldWidget(
            label: 'Email',
            text: user.email,
            onChanged: (name) {},
          ),
          SizedBox(
            height: 20,
          ),
          TextFieldWidget(
            label: 'Password',
            text: user.password,
            onChanged: (name) {},
          ),
          SizedBox(
            height: 20,
          ),
          TextFieldWidget(
            label: 'Phone',
            text: user.phone,
            onChanged: (name) {},
          ),
          SizedBox(
            height: 20,
          ),
          TextFieldWidget(
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
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
