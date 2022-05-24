import 'package:flutter/material.dart';

import '../components/text_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: const Color.fromRGBO(118, 72, 216, 1),
      ),
      body: Container(
        child: Container(
          padding: EdgeInsets.only(top: height * 0.04),
          alignment: Alignment.topCenter,
          child: TextContainer(
            text: "Username",
            presetFontSizes: const [24, 22, 20, 18, 16],
            textAlign: TextAlign.center,
            width: width * 0.6,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
