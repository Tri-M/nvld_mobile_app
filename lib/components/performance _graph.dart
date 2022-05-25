import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.y, this.day);
  final int x;
  final double y;
  final String day;
}

class PerformanceGraph extends StatelessWidget {
  const PerformanceGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(1, 12, "mon"),
      ChartData(2, 7, "tues"),
      ChartData(3, 5, "wed"),
      ChartData(4, 10, "thur"),
      ChartData(5, 10, "fri"),
      ChartData(6, 13, "sat"),
      ChartData(7, 5, "sun"),
    ];
    final List<Color> color = <Color>[];
    color.add(Color.fromARGB(255, 203, 180, 226)!);
    color.add(Color.fromARGB(255, 175, 129, 229)!);
    color.add(Color.fromARGB(255, 110, 0, 206));

    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(0.5);
    stops.add(1.0);

    final LinearGradient gradientColors =
        LinearGradient(colors: color, stops: stops);
    return SfCartesianChart(
        primaryXAxis: NumericAxis(
            labelFormat: 'day',
            labelIntersectAction: AxisLabelIntersectAction.rotate45),
        title: ChartTitle(text: "Performance"),
        series: <ChartSeries>[
          // Renders area chart
          AreaSeries<ChartData, int>(
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              gradient: gradientColors)
        ]);
  }
}
