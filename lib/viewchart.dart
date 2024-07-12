import 'package:charts/widgets/charts/barchart.dart';
import 'package:charts/homepage.dart';
import 'package:charts/widgets/charts/linechart.dart';
import 'package:charts/widgets/charts/piechart.dart';
import 'package:flutter/material.dart';

class viewChart extends StatelessWidget {
  const viewChart(
      {super.key,
      required this.chartType,
      required this.xValue,
      required this.yValue});
  final String chartType;
  final List<String> xValue;
  final List<String> yValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 47, 243),
        title: Text(
          'View Chart: $chartType',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        // scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            if (chartType == 'line chart 1')
              Container(
                height: 400,
                width: 600,
                child: LineChartDatas(xValue: xValue, yValue: yValue),
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
                height: 400,
                width: 600,
                child: PieChartDatas(xValue: xValue),
              ),
            // ],
            // )
            if (chartType == 'bar chart 1')
              Container(
                height: 400,
                width: 600,
                child: BarChartDatas(xValue: xValue, yValue: yValue),
              ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                        // chartType: dropdownValue,
                        // xValue: xValue.text.split(','),
                        // yValue: yValue.text.split(',')),
                      ),
                    );
                  },
                  child: const Text(
                    'Go back',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Save chart logic goes here
                  },
                  child: const Text(
                    'Save Chart',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        // ],

        // )
      ),
    );
  }
}
