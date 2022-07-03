import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nvld_app/components/common_layout.dart';
import 'package:nvld_app/components/performance%20_graph.dart';
import 'package:nvld_app/constants.dart';
import 'package:nvld_app/screens/admin/admin_Approve.dart';
import 'package:nvld_app/screens/admin/admin_addstaff.dart';
import 'package:nvld_app/screens/admin/admin_performance.dart';
import 'package:nvld_app/screens/student/student_dashboard_drawer.dart';
import 'package:provider/provider.dart';

import '../../provider/user_provider.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  FirebaseStorage storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();

  void getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var file = File(image.path);
      // print(image.path);
      var snapshot = await storage.ref().child('images/logo').putFile(file);
      if (snapshot.state == TaskState.success) {
        Fluttertoast.showToast(msg: "Image Uploaded Successfully");
        var imageUrl = await (snapshot).ref.getDownloadURL();
        var url = imageUrl.toString();
        Provider.of<UserProvider>(context, listen: false).logoUrl = url;
        setState(() {});
      }
      // print(url);
      // var snapshot2= storage.ref().child('images/logo');
      // var imageUrl = await (snapshot2).getDownloadURL();
      // print(imageUrl.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var size = MediaQuery.of(context).size;
    var cardTextStyle = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 14,
        color: Color.fromRGBO(63, 63, 63, 1));
    return CommonLayout(
      child: Scaffold(
        drawer: StudentDashboardDrawer(),
        appBar: AppBar(
          toolbarHeight: height * 0.1,
          elevation: 0,
          flexibleSpace: Image(
            image: NetworkImage(
              Provider.of<UserProvider>(context, listen: true).logoUrl,
            ),
          ),
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
                          // Card(
                          //   shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(
                          //           8)), //rounded rectangel
                          //   elevation: 4,
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: <Widget>[
                          //       Image.asset(
                          //         'assets/upload.jpg',
                          //         height: 100,
                          //       ),
                          //       TextButton(
                          //         style: ButtonStyle(
                          //           foregroundColor:
                          //               MaterialStateProperty.all<Color>(
                          //                   Colors.blue),
                          //         ),
                          //         onPressed: () {
                          //           Navigator.push(
                          //             context,
                          //             MaterialPageRoute(
                          //               builder: (context) => Approve(),
                          //             ),
                          //           );
                          //         },
                          //         child: Text('Confirm Upload'),
                          //       ),
                          //     ], //<Widget>[]
                          //   ), //column
                          // ),
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
                          // Card(
                          //   shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(
                          //           8)), //rounded rectangel
                          //   elevation: 4,
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: <Widget>[
                          //       Image.asset(
                          //         'assets/performance.png',
                          //         height: 100,
                          //       ),
                          //       TextButton(
                          //         style: ButtonStyle(
                          //           foregroundColor:
                          //               MaterialStateProperty.all<Color>(
                          //                   Colors.blue),
                          //         ),
                          //         onPressed: () {
                          //           Navigator.push(
                          //             context,
                          //             MaterialPageRoute(
                          //               builder: (context) => Performance(),
                          //             ),
                          //           );
                          //         },
                          //         child: Text('Performance'),
                          //       ),
                          //     ], //<Widget>[]
                          //   ), //column
                          // ), //Card
                        ], //<Widget>[]
                      ), //gridview count
                    ), //Expanded
                  ], //<Widget>[]
                ), //Column
              ), //padding
            ), //SafeArea
          ], // <Widget> []
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            getImage();
          },
          backgroundColor: primaryPurple,
          child: Icon(Icons.upload_file, color: Colors.white),
        ), //stack
      ),
    ); //scaffold
  }
}
