import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double y;
}

class PerformanceGraph extends StatelessWidget {
  const PerformanceGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(1924, 12),
      ChartData(1925, 7),
      ChartData(1926, 5),
      ChartData(1927, 10),
      ChartData(1928, 10),
      ChartData(1929, 13),
      ChartData(1930, 5),
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
        primaryYAxis: NumericAxis(labelFormat: '{value}'),
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
