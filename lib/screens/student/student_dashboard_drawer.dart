import 'package:flutter/material.dart';
import 'package:nvld_app/Screens/welcome_screen.dart';
import 'package:provider/provider.dart';
import '../../provider/user_provider.dart';
import 'profile_page.dart';

class StudentDashboardDrawer extends StatelessWidget {
  const StudentDashboardDrawer({Key? key}) : super(key: key);

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
              Provider.of<UserProvider>(context, listen: false).logout();
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
