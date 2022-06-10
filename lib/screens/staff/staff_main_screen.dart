import "package:flutter/material.dart";
import 'package:nvld_app/components/side_menu.dart';
import 'package:nvld_app/controllers/drawer_control.dart';
import 'package:nvld_app/screens/staff/responsiveness.dart';
import 'package:nvld_app/screens/staff/staff_dashboard.dart';
import "package:provider/provider.dart";

class StaffMainScreen extends StatelessWidget {
  const StaffMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<DrawerControl>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsiveness.isDesktop(context))
              Expanded(
                child: SideMenu(),
              ),
            Expanded(
              child: StaffDashboardScreen(),
              flex: 5,
            )
          ],
        ),
      ),
    );
  }
}
