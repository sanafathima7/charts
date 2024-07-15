import 'package:charts/custom_box1_piechart.dart';
import 'package:charts/custom_box2_barchart.dart';
import 'package:charts/custom_box_line_chart.dart';
import 'package:flutter/material.dart';

class SavedChart extends StatelessWidget {
  const SavedChart({
    Key? key,
    required this.chartType,
    required this.xValue,
    required this.yValue,
  }) : super(key: key);

  final String chartType;
  final List<String> xValue;
  final List<String> yValue;

  @override
  Widget build(BuildContext context) {
    Widget chartWidget;

    switch (chartType) {
      case 'line chart 1':
        chartWidget = custom_box_line_chart();
        break;
      case 'pie chart 1':
        chartWidget = custom_box1_pie_chart();
        break;
      case 'bar chart 1':
        chartWidget = custom_box2_bar_chart();
        break;
      default:
        chartWidget = Center(child: Text('Unsupported chart type'));
        break;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 212, 240, 134),
        title: Text(
          'Saved Charts',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: chartWidget,
    );
  }
}
