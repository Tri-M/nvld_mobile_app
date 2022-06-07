import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nvld_app/components/performance%20_graph.dart';
import 'package:nvld_app/screens/admin/admin_Approve.dart';
import 'package:nvld_app/screens/admin/admin_addstaff.dart';
import 'package:nvld_app/screens/admin/admin_performance.dart';
import 'package:nvld_app/screens/student/student_dashboard_drawer.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var size = MediaQuery.of(context).size;
    var cardTextStyle = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 14,
        color: Color.fromRGBO(63, 63, 63, 1));
    return Scaffold(
      drawer: StudentDashboardDrawer(),
      appBar: AppBar(
        toolbarHeight: height * 0.1,
        elevation: 0,
        backgroundColor: const Color.fromRGBO(118, 72, 216, 1),
        title: Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: width * 0.006),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              shape: const CircleBorder(),
              padding: EdgeInsets.all(width * 0.005),
            ),
            child: Icon(
              Icons.person,
              size: height * 0.04,
              color: const Color.fromRGBO(88, 57, 178, 1),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Admin(),
                ),
              );
            },
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          // Container(
          //   height: size.height * .3,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //         alignment: Alignment.topCenter,
          //         image: AssetImage(
          //             'assets/images/top_header.png')), //decorationimage
          //   ), //box
          // ), //Container

          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      crossAxisCount: 2,
                      children: <Widget>[
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8)), //rounded rectangel
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/upload.jpg',
                                height: 100,
                              ),
                              TextButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.blue),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Approve(),
                                    ),
                                  );
                                },
                                child: Text('Confirm Upload'),
                              ),
                            ], //<Widget>[]
                          ), //column
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Admin_addstaff(),
                              ),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8)), //rounded rectangel
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/staff.jpg',
                                  height: 100,
                                ),
                                TextButton(
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blue),
                                  ),
                                  onPressed: () {},
                                  child: Text('Add Staff'),
                                ),
                              ], //<Widget>[]
                            ), //column
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8)), //rounded rectangel
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/performance.png',
                                height: 100,
                              ),
                              TextButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.blue),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Performance(),
                                    ),
                                  );
                                },
                                child: Text('Performance'),
                              ),
                            ], //<Widget>[]
                          ), //column
                        ), //Card
                      ], //<Widget>[]
                    ), //gridview count
                  ), //Expanded
                ], //<Widget>[]
              ), //Column
            ), //padding
          ), //SafeArea
        ], // <Widget> []
      ), //stack
    ); //scaffold
  }
}
