// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:nvld_app/components/rounded_number_field.dart';
import 'package:nvld_app/components/rounded_password_field.dart';
import '../components/rounded_input_field.dart';
import '../components/text_container.dart';
import '../constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: Container(
          alignment: Alignment.centerRight,
          child: FlatButton(
            child: Icon(
              Icons.save,
              size: (height + width) / 2 * 0.05,
              color: kPrimaryLightColor,
            ),
            onPressed: () {
              //save data
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.4,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(height * 0.04),
                  bottomRight: Radius.circular(height * 0.04),
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(top: height * 0.04),
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(bottom: height * 0.03),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: kPrimaryLightColor,
                          shape: const CircleBorder(),
                          padding: EdgeInsets.all((height + width) / 2 * 0.04),
                        ),
                        child: Icon(
                          Icons.person,
                          size: height * 0.08,
                          color: primaryPurple,
                        ),
                        onPressed: () {
                          //Change dp
                        },
                      ),
                    ),
                    TextContainer(
                      text: "User Name",
                      presetFontSizes: const [26, 24, 22, 20, 18],
                      textAlign: TextAlign.center,
                      width: width * 0.6,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextContainer(
                      text: "#userid123",
                      presetFontSizes: const [18, 16, 14, 12, 10],
                      textAlign: TextAlign.center,
                      width: width * 0.6,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 190, 190, 190),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //profile_list
            Container(
              padding: EdgeInsets.only(
                top: height * 0.02,
                left: width * 0.05,
                right: width * 0.05,
                bottom: height * 0.02,
              ),
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                        bottom: height * 0.015, left: width * 0.03),
                    child: TextContainer(
                      text: "Name",
                      presetFontSizes: const [20, 18, 16, 14, 12],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  RoundedInputField(
                    hintText: "Name",
                    icon: Icons.person,
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
            //profile_list
            Container(
              padding: EdgeInsets.only(
                top: height * 0.02,
                left: width * 0.05,
                right: width * 0.05,
                bottom: height * 0.02,
              ),
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                        bottom: height * 0.015, left: width * 0.03),
                    child: TextContainer(
                      text: "E-mail",
                      presetFontSizes: const [20, 18, 16, 14, 12],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  RoundedInputField(
                    hintText: "E-mail",
                    icon: Icons.email,
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),

            //profile_list
            Container(
              padding: EdgeInsets.only(
                top: height * 0.02,
                left: width * 0.05,
                right: width * 0.05,
                bottom: height * 0.02,
              ),
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                      bottom: height * 0.015,
                      left: width * 0.03,
                    ),
                    child: TextContainer(
                      text: "Password",
                      presetFontSizes: const [20, 18, 16, 14, 12],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  RoundedPasswordField(
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),

            //profile_list
            Container(
              padding: EdgeInsets.only(
                top: height * 0.02,
                left: width * 0.05,
                right: width * 0.05,
                bottom: height * 0.02,
              ),
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                      bottom: height * 0.015,
                      left: width * 0.03,
                    ),
                    child: TextContainer(
                      text: "Phone",
                      presetFontSizes: const [20, 18, 16, 14, 12],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  RoundedNumberField(
                    hintText: "Phone",
                    icon: Icons.call,
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
