import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BarChartDataSample extends StatelessWidget {
  const BarChartDataSample({super.key});
  // final List<String> xValue;
  // final List<String> yValue;

  @override
  Widget build(BuildContext context) {
    // List<double> xValues = xValue.map((e) => double.parse(e)).toList();

    // List<double> yValues = yValue.map((e) => double.parse(e)).toList();

    // List<BarChartGroupData> spots = List.generate(
    //   xValues.length,
    //   (index) => BarChartGroupData(
    //       x: index, barRods: [BarChartRodData(toY: yValues[index])]),
    // );
    return BarChart(
      BarChartData(
        minY: 0,
        maxY: 100,
        barGroups: [
          BarChartGroupData(x: 10, barRods: [BarChartRodData(toY: 20)]),
          BarChartGroupData(x: 30, barRods: [BarChartRodData(toY: 50)]),
          BarChartGroupData(x: 50, barRods: [BarChartRodData(toY: 70)]),
        ],
      ),
    );
  }
}
