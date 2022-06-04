import 'package:fl_chart/fl_chart.dart';
import "package:flutter/material.dart";
import "../../../constants.dart";

class Chart extends StatelessWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: Stack(children: [
          PieChart(PieChartData(
              sectionsSpace: 0,
              startDegreeOffset: -90,
              centerSpaceRadius: 70,
              sections: paiChartSelectionDatas)),
          Positioned.fill(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: defaultPadding,
              ),
              Text("12",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      height: 0.5)),
            ],
          ))
        ]));
  }
}

List<PieChartSectionData> paiChartSelectionDatas = [
  PieChartSectionData(
    color: Colors.white,
    value: 25,
    showTitle: false,
    radius: 25,
  ),
  PieChartSectionData(
    color: Color.fromARGB(255, 126, 11, 147),
    value: 20,
    showTitle: false,
    radius: 22,
  ),
  PieChartSectionData(
    color: Color.fromARGB(255, 200, 80, 231),
    value: 10,
    showTitle: false,
    radius: 19,
  ),
  PieChartSectionData(
    color: Color.fromARGB(255, 122, 39, 238),
    value: 15,
    showTitle: false,
    radius: 16,
  ),
  PieChartSectionData(
    color: kPrimaryColor.withOpacity(0.1),
    value: 25,
    showTitle: false,
    radius: 13,
  ),
];
