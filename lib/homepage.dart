// import 'package:charts/mainhomepage.dart';
// import 'package:charts/provider/provider.dart';
import 'package:charts/mainhomepage.dart';
import 'package:charts/provider/providerbottom.dart';
import 'package:charts/saveChart.dart';
import 'package:flutter/material.dart';
import 'package:charts/viewchart.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  // String dropdownValue = 'line chart 1';

  // List<String> items = [
  //   'line chart 1',
  //   'line chart 2',
  //   'bar chart 1',
  //   'bar chart 2',
  //   'pie chart 1',
  //   'pie chart 2',
  // ];

  final TextEditingController xValue = TextEditingController();

  final TextEditingController yValue = TextEditingController();

  final TextEditingController chartType = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final providerdropdowns = Provider.of<providerdropdown>(context);
    final providerNavigationbutton = Provider.of<NavigationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 47, 243),
        title: const Text(
          'Charts',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: Consumer<NavigationProvider>(
        builder:
            (BuildContext context, NavigationProvider value, Widget? child) {
          return IndexedStack(
            index: providerNavigationbutton.myIndex,
            children: providerNavigationbutton.widgetList,
          );
        },
      ),
    );

    //   mainHomepage(
    //       providerdropdowns: providerdropdowns,
    //       xValue: xValue,
    //       yValue: yValue,
    //       providerNavigationbutton: providerNavigationbutton),
    // );
  }
}
