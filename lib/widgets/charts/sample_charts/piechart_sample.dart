import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PieChartSample extends StatelessWidget {
  const PieChartSample({
    super.key,
    // required this.xValue,
  });
  // final List<String> xValue;

  @override
  Widget build(BuildContext context) {
    // List<double> xValues = xValue.map((e) => double.parse(e)).toList();

    // List<double> yValues = yValue.map((e) => double.parse(e)).toList();

    // List<Color> colorslist = [
    //   Colors.yellow,
    //   Colors.blue,
    //   Colors.green,
    //   Colors.red,
    // ];
    // List<PieChartSectionData> spots = List.generate(
    //   xValues.length,
    //   (index) => PieChartSectionData(
    //     value: xValues[index],
    //     color: colorslist[index % colorslist.length],
    //   ),
    // );
    return PieChart(
      swapAnimationDuration: const Duration(milliseconds: 7500),
      PieChartData(sections: [
        PieChartSectionData(
          color: Colors.blue,
          value: 30,
        ),
        PieChartSectionData(
          color: Colors.green,
          value: 60,
        ),
        PieChartSectionData(
          color: Colors.yellow,
          value: 10,
        )
      ]),
    );
  }
}
