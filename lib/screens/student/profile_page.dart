import 'package:flutter/material.dart';
import 'package:nvld_app/components/common_layout.dart';
import 'package:nvld_app/components/text_container.dart';
import 'package:nvld_app/constants.dart';
import 'package:nvld_app/screens/student/edit_profile_page.dart';
import 'package:nvld_app/utils/user_preferences.dart';
import '../../models/user.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/numbers_widget.dart';
import '../../widget/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      child: Scaffold(
        appBar: buildAppBar(context),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: user.imagePath,
              onClicked: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditProfilePage(),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            buildName(user),
            SizedBox(height: 25),
            NumbersWidget(),
            SizedBox(height: 20),
            buildAbout(user),
          ],
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          TextContainer(
            text: user.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            presetFontSizes: [24, 22, 20, 18, 16],
          ),
          SizedBox(height: 4),
          TextContainer(
            text: user.email,
            style: const TextStyle(
              color: Colors.grey,
            ),
            presetFontSizes: [16, 15, 14, 13, 12],
          ),
        ],
      );
}

Widget buildAbout(User user) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 48),
    child: Column(
      children: [
        Container(
          width: 200,
          child: Divider(
            color: dividerColor,
            thickness: 0.8,
          ),
        ),
        SizedBox(height: 15),
        Text(
          "About",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        // TextContainer(
        //   textAlign: TextAlign.left,
        //   text: "About",
        //   style: TextStyle(
        //     fontWeight: FontWeight.bold,
        //   ),
        //   presetFontSizes: [24, 22, 20, 18, 16],
        // ),
        SizedBox(height: 15),
        Text(
          user.about,
          style: TextStyle(
            fontSize: 17,
            height: 1.5,
          ),
        ),
      ],
    ),
  );
}
