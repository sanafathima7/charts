import 'package:charts/mainhomepage.dart';
import 'package:charts/saveChart.dart';
import 'package:charts/viewchart.dart';
import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  NavigationProvider({
    required this.chartType,
    required this.xValue,
    required this.yValue,
  });

  String chartType;
  List<String> xValue;
  List<String> yValue;

  int myIndex = 0;
  // final List<String> xValue;
  // final List<String> yValue;

  List<Widget> widgetList = [
    // mainHomepage(),
    ViewChart(
      chartType: '',
      xValue: [],
      yValue: [],
    ),
    SavedChart(
      chartType: '',
      xValue: [],
      yValue: [],
    ),
  ];

  void updatedValue({
    required BuildContext context,
    required String chartType,
    required List<String> xValue,
    required List<String> yValue,
  }) {
    this.xValue = xValue;
    this.yValue = yValue;
    this.chartType = chartType;
    notifyListeners();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ViewChart(
          chartType: chartType,
          xValue: xValue,
          yValue: yValue,
        ),
      ),
    );
  }

  Widget navigationProvider(
    BuildContext context,
    int index, {
    required String chartType,
    required List<String> xValue,
    required List<String> yValue,
  }) {
    this.xValue = xValue;
    this.yValue = yValue;
    this.chartType = chartType;
    // notifyListeners();

    switch (index) {
      case 0:
        return mainHomepage();
      case 1:
        return ViewChart(
          chartType: chartType,
          xValue: xValue,
          yValue: yValue,
        );
      case 2:
        return SavedChart(
          chartType: chartType,
          xValue: xValue,
          yValue: yValue,
        );
      default:
        return mainHomepage();
    }
  }

  void currentIncrement(index) {
    myIndex = index;
    notifyListeners();
  }
}
