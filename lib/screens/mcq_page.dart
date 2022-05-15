import 'package:flutter/material.dart';
import 'package:nvld_app/components/common_layout.dart';
import 'package:nvld_app/components/text_container.dart';
import 'package:nvld_app/constants.dart';

class McqPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return CommonLayout(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.01),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back_ios,
                          size: width * 0.04, color: primaryPurple),
                      SizedBox(width: width * 0.01),
                      TextContainer(
                          text: 'Previous',
                          presetFontSizes: [16, 14, 12, 10],
                          width: width * 0.2,
                          style: TextStyle(
                              color: primaryPurple,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      TextContainer(
                          text: 'Next',
                          presetFontSizes: [16, 14, 12, 10],
                          width: width * 0.2,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: primaryPurple,
                              fontWeight: FontWeight.bold)),
                      SizedBox(width: width * 0.01),
                      Icon(Icons.arrow_forward_ios,
                          size: width * 0.04, color: primaryPurple),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.04),
            Container(
              height: height * 0.06,
              decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(
                        1,
                        3,
                      ),
                      blurRadius: 4,
                      spreadRadius: 2.0,
                    ),
                  ]),
                  child:Row(
                    children:[
                      // Container(
                      //   width:width*0.7,
                      //   child:LinearPercentIndicator(
                      //     width: width*0.7,
                      //     lineHeight: 20.0,
                      //     percent: 0.5,
                      //     backgroundColor: Colors.grey[200],
                      //     progressColor: primaryPurple,
                      //   ),
                      // ),
                    ],
                  ),

            ),
            SizedBox(height:height*0.02),
            
          ],
        ),
      ),
    );
  }
}
