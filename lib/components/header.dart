import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:nvld_app/constants.dart';
import 'package:nvld_app/screens/staff/responsiveness.dart';
import "/controllers/drawer_control.dart";
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsiveness.isDesktop(context))
          IconButton(
            onPressed: context.read<DrawerControl>().ControlMenu,
            icon: Icon(Icons.menu),
          ),
        if (!Responsiveness.isMobile(context))
          Text("Dashboard", style: TextStyle(color: Colors.white)),
        if (!Responsiveness.isMobile(context))
          Spacer(flex: Responsiveness.isDesktop(context) ? 2 : 1),
        ProfileCard()
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.only(right: defaultPadding),
        // padding: EdgeInsets.symmetric(
        //     horizontal: defaultPadding, vertical: defaultPadding / 2),
        decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.white10)),
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Image.asset("assets/images/profile_pic.png", height: 36),
        ]));
  }
}
