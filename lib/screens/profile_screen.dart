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
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.purple[50],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: height * 0.46,
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(height * 0.04),
                bottomRight: Radius.circular(height * 0.04),
              ),
            ),
          ),
          Container(
            height: height * 0.35,
            decoration: BoxDecoration(
              color: Colors.purple[50],
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
                        primary: const Color.fromARGB(255, 133, 110, 200),
                        shape: const CircleBorder(),
                        padding: EdgeInsets.all(width * 0.05),
                      ),
                      child: Icon(
                        Icons.person,
                        size: height * 0.08,
                        color: Colors.white,
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
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextContainer(
                    text: "#userid123",
                    presetFontSizes: const [18, 16, 14, 12, 10],
                    textAlign: TextAlign.center,
                    width: width * 0.6,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 158, 158, 158),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
