import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nvld_app/screens/admin/admin.dart';

class Approve extends StatefulWidget {
  const Approve({Key? key}) : super(key: key);

  @override
  State<Approve> createState() => _ApproveState();
}

class _ApproveState extends State<Approve> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
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
    );
  }
}
