import 'package:flutter/material.dart';
import 'package:nvld_app/components/common_layout.dart';
import 'package:nvld_app/components/rounded_input_field.dart';
import 'package:nvld_app/components/text_container.dart';
import '../../models/to_student.dart';
import '../../constants.dart';

class StudentInviteScreen extends StatelessWidget {
  StudentInviteScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return CommonLayout(
      child: Column(
        children: [
          Positioned(
            top: -100,
            child: Container(
              width: width,
              height: height * 0.1,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(118, 72, 216, 1),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.elliptical(450, 100),
                    bottomLeft: Radius.elliptical(450, 100)),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: height * 0.02,
              left: width * 0.05,
              right: width * 0.05,
              bottom: height * 0.02,
            ),
            // color: Colors.white,
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
                  icon: Icons.email_outlined,
                  onChanged: (value) {},
                  controller: emailController,
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
                primary: kPrimaryColor),
            child: const Text('Invite'),
            onPressed: () {
              toteacher(emailController.text);
            },
          ),
        ],
      ),
    );
  }
}
