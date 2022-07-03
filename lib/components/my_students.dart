import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nvld_app/components/text_container.dart';
import 'package:nvld_app/constants.dart';
import 'package:nvld_app/models/my_students.dart';
import 'package:nvld_app/screens/staff/responsiveness.dart';
import 'package:nvld_app/screens/staff/student_invite.dart';
import 'package:nvld_app/screens/staff/upload_question_page.dart';
import 'info_card.dart';
import 'dart:convert';

class MyStudents extends StatefulWidget {
  const MyStudents({Key? key}) : super(key: key);

  @override
  State<MyStudents> createState() => _MyStudentsState();
}

class _MyStudentsState extends State<MyStudents> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late Stream<QuerySnapshot> _usersStream;

  @override
  void initState() {
    User? user = _auth.currentUser;
    _usersStream = FirebaseFirestore.instance
        .collection('users')
        .where("Staff", isEqualTo: user!.email)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          width: width * 0.9,
          height: (height + width) * 0.1,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: kPrimaryLightColor,
            elevation: 10,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(
                    top: height * 0.0025,
                    left: width * 0.05,
                  ),
                  child: TextContainer(
                    text: 'Add new students',
                    presetFontSizes: [18, 16, 14],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                SizedBox(height: defaultPadding),
                Container(
                  height: (height + width) * 0.03,
                  width: (height + width) * 0.14,
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      onPrimary: kPrimaryLightColor,
                      primary: kPrimaryColor,
                    ),
                    onPressed: () {
                      final _auth = FirebaseAuth.instance;
                      User? user = _auth.currentUser;

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Staff_addstud(
                            staffmail: user!.email,
                          ),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          size: (height + width) * 0.015,
                          color: kPrimaryLightColor,
                        ),
                        TextContainer(
                          text: "Invite",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kPrimaryLightColor,
                          ),
                          presetFontSizes: [18, 16, 14, 12],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: defaultPadding,
        ),
        SizedBox(
          width: width * 0.9,
          height: (height + width) * 0.1,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: kPrimaryLightColor,
            elevation: 10,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(
                    top: height * 0.025,
                    left: width * 0.05,
                  ),
                  child: TextContainer(
                    text: 'Upload new question',
                    presetFontSizes: [18, 16, 14],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                SizedBox(height: defaultPadding),
                Container(
                  height: (height + width) * 0.03,
                  width: (height + width) * 0.14,
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      onPrimary: kPrimaryLightColor,
                      primary: kPrimaryColor,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UploadQuestionPage(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          size: (height + width) * 0.015,
                          color: kPrimaryLightColor,
                        ),
                        TextContainer(
                          text: "Question",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kPrimaryLightColor,
                          ),
                          presetFontSizes: [18, 16, 14, 12],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: defaultPadding),
        TextContainer(
          text: "My Students",
          presetFontSizes: [24, 22, 20, 18, 16],
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading...");
            }

            if (snapshot.data == null) {
              return Text("0");
            }

            return Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height /
                      2, // constrain height
                  child: ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      String Name;
                      if (data['Name'] == "") {
                        Name = data['Email'].split("@")[0];
                      } else {
                        Name = data['Name'];
                      }
                      return StudentCard(name: Name, email: data['Email']);
                    }).toList(),
                  ),
                )
              ],
            );
          },
        ),
        // // StudentCard(name: 'Abishek', email: 'abishek@gmail.com'),
        // // StudentCard(name: 'Trisha', email: 'trisha@gmail.com'),
        // // StudentCard(name: 'Karthik', email: 'karthik@gmail.com'),
        // const SizedBox(
        //   height: defaultPadding,
        // ),
        // Responsiveness(
        //   mobile: StudentInfoCardGridView(
        //     crossAxisCount: _size.width < 650 ? 2 : 4,
        //     childAspectRatio: _size.width < 650 ? 1.3 : 1,
        //   ),
        //   tablet: StudentInfoCardGridView(),
        //   desktop: StudentInfoCardGridView(
        //     childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
        //   ),
        // ),
      ],
    );
  }
}

class StudentCard extends StatelessWidget {
  final String name;
  final String email;
  const StudentCard({
    Key? key,
    required this.name,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: defaultPadding,
        ),
        Container(
          height: (height + width) * 0.095,
          width: (width + height) * 0.45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: kPrimaryLightColor,
            boxShadow: [
              BoxShadow(
                color: kPrimaryColor,
                offset: Offset(
                  0,
                  height * 0.005,
                ),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
              left: width * 0.05,
              top: height * 0.025,
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextContainer(
                      text: name,
                      presetFontSizes: [18, 16, 14],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextContainer(
                      text: email,
                      presetFontSizes: [18, 16, 14],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class StudentInfoCardGridView extends StatelessWidget {
  const StudentInfoCardGridView({
    Key? key,
    this.crossAxisCount = 6,
    this.childAspectRatio = 2,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: myStudents.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => InfoCard(info: myStudents[index]),
    );
  }
}
