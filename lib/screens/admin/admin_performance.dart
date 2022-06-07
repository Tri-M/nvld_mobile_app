import 'package:flutter/material.dart';
import 'package:nvld_app/components/performance%20_graph.dart';
import 'package:nvld_app/screens/admin/admin.dart';

class Performance extends StatefulWidget {
  const Performance({Key? key}) : super(key: key);

  @override
  State<Performance> createState() => _PerformanceState();
}

class _PerformanceState extends State<Performance> {
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
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Card(
          elevation: height * 0.03,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            height: height * 0.2,
            width: width * 0.75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[100],
            ),
            child: Container(
              padding: EdgeInsets.only(
                top: height * 0.01,
                bottom: height * 0.01,
                right: width * 0.06,
                left: width * 0.02,
              ),
              child: PerformanceGraph(),
            ),
          ),
        ),
      ),
    );
  }
}
