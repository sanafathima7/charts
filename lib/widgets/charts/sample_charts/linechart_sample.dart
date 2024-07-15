import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineChartSample extends StatelessWidget {
  const LineChartSample({super.key});

  @override
  Widget build(BuildContext context) => LineChart(
        LineChartData(
            minX: 0,
            minY: 0,
            maxX: 10,
            maxY: 30,
            gridData: FlGridData(
                show: true,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: Colors.red,
                    strokeWidth: 1,
                  );
                },
                drawVerticalLine: true,
                getDrawingVerticalLine: (value) {
                  return FlLine(
                    color: Colors.blue,
                    strokeWidth: 1,
                  );
                }),
            borderData: FlBorderData(
              show: true,
            ),
            lineBarsData: [
              LineChartBarData(spots: [
                FlSpot(0, 2),
                FlSpot(1, 6),
                FlSpot(2, 8),
                FlSpot(3, 13),
                FlSpot(4, 20),
                FlSpot(5, 2),
              ])
            ]),
      );
}
