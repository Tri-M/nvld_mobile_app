import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Image.asset("assets/images/logo.png")),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: " ",
            press: () {},
          ),
          DrawerListTile(
            title: "Profile",
            svgSrc: " ",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: press,
        horizontalTitleGap: 0.0,
        leading: SvgPicture.asset(
          svgSrc,
          // color: Color.fromARGB(153, 198, 191, 191),
          color:Colors.purple,
          height: 16,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.purple,
          ),
        ));
  }
}
