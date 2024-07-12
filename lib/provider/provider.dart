import 'package:flutter/material.dart';

class providerdropdown extends ChangeNotifier {
  String dropdownValue = 'line chart 1';

  List<String> items = [
    'line chart 1',
    'line chart 2',
    'bar chart 1',
    'bar chart 2',
    'pie chart 1',
    'pie chart 2',
  ];

  void changeprovider(String? newValue) {
    if (newValue != null) {
      dropdownValue = newValue;
      notifyListeners();
    }
  }
}
