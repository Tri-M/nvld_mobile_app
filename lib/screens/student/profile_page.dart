import 'package:cloud_firestore/cloud_firestore.dart';
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
import 'package:firebase_auth/firebase_auth.dart';
import '../../components/body_login.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  late Stream<QuerySnapshot> _usersStream;

  @override
  void initState() {
    User? user = _auth.currentUser;
    _usersStream = FirebaseFirestore.instance
        .collection('users')
        .where("Email", isEqualTo: user!.email)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      child: Scaffold(
        appBar: buildAppBar(context),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: '/assets/images/profile.png',
              onClicked: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditProfilePage(),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            // buildName(user),
            Center(
              child: Text(
                "Profile Details",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(height: 15),
            StreamBuilder<QuerySnapshot>(
              stream: _usersStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }

                return Column(
                  children: <Widget>[
                    SizedBox(
                        height: 500, // constrain height
                        child: ListView(
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          String Name, phone;
                          if (data['Staff'] == "") {
                            Name = "No Mentor assigned";
                          } else {
                            Name = data['Staff'];
                          }

                          if (data['Phonenumber'] == "") {
                            phone = "No Phonenumber Given";
                          } else {
                            phone = data['Phonenumber'];
                          }

                          return Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    'Name',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  subtitle: Text(
                                    data['Name'],
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                ListTile(
                                  title: Text('Email',
                                      style: TextStyle(fontSize: 20)),
                                  subtitle: Text(data['Email'],
                                      style: TextStyle(fontSize: 18)),
                                ),
                                ListTile(
                                  title: Text('Date of birth',
                                      style: TextStyle(fontSize: 20)),
                                  subtitle: Text(data['Dob'],
                                      style: TextStyle(fontSize: 18)),
                                ),
                                ListTile(
                                  title: Text('Level',
                                      style: TextStyle(fontSize: 20)),
                                  subtitle: Text("${data['Level']}",
                                      style: TextStyle(fontSize: 18)),
                                ),
                                ListTile(
                                  title: Text('Phone Number',
                                      style: TextStyle(fontSize: 20)),
                                  subtitle: Text(phone,
                                      style: TextStyle(fontSize: 18)),
                                ),
                                ListTile(
                                  title: Text('Mentor',
                                      style: TextStyle(fontSize: 20)),
                                  subtitle: Text(Name,
                                      style: TextStyle(fontSize: 18)),
                                ),
                              ],
                            ),
                          );
                        }).toList()))
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
