import 'package:charts/widgets/charts/sample_charts/barchart_sample.dart';
import 'package:charts/widgets/charts/sample_charts/linechart_sample.dart';
import 'package:charts/widgets/charts/sample_charts/piechart_sample.dart';
import 'package:charts/widgets/custom_piechart_textfield.dart';
import 'package:charts/widgets/customtextfield.dart';
import 'package:flutter/material.dart';

class customContainer extends StatelessWidget {
  const customContainer({
    super.key,
    required this.xValue,
    required this.yValue,
    required this.chartType,
  });

  final TextEditingController xValue;
  final TextEditingController yValue;
  final String chartType;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (chartType == 'line chart 1')
            Container(
              height: 200,
              width: 250,
              child: LineChartSample(),
            ),
          SizedBox(
            height: 20,
          ),
          // Stack(
          //   children: [
          //     Text(
          //       'Data demo',
          //     ),
          if (chartType == 'pie chart 1')
            Container(
              height: 200,
              width: 200,
              child: PieChartSample(),
            ),
          // ],
          // )
          if (chartType == 'bar chart 1')
            Container(
              height: 200,
              width: 200,
              child: BarChartDataSample(),
            ),
          SizedBox(
            height: 20,
          ),
          if (chartType == 'pie chart 1')
            fieldsPieChart(
              xController: xValue,
            ),
          if (chartType == 'bar chart 1' || chartType == 'line chart 1')
            fields(
              xController: xValue,
              yController: yValue,
            ),
        ],
      ),
    );
  }
}
