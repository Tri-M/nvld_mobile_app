import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import 'package:nvld_app/screens/staff/staff_dashboard.dart';
import 'package:nvld_app/screens/student/profile_page.dart';
import 'package:nvld_app/screens/welcome_screen.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Drawer(
      child: Column(
        children: [
          Container(
            height: height * 0.15,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: const Color.fromRGBO(118, 72, 216, 1),
            child: const Text(
              "Dashboard",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                  color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              size: width * 0.075,
            ),
            title: Text('Profile'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              size: width * 0.075,
            ),
            title: Text('Logout'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.help,
              size: width * 0.07,
            ),
            title: Text('Help'),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
