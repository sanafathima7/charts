import 'package:charts/provider/provider.dart';
import 'package:charts/widgets/customtextfield.dart';
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

  @override
  Widget build(BuildContext context) {
    final providerdropdowns = Provider.of<providerdropdown>(context);

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              child: const Card(
                color: const Color.fromARGB(255, 149, 235, 152),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Icon(
                        Icons.person,
                        size: 50,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Hi, Unknown',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DropdownButton<String>(
                value: providerdropdowns.dropdownValue,
                items: providerdropdowns.items.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: providerdropdowns.changeprovider,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            fields(
              xController: xValue,
              yController: yValue,
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    List<String> xValues = xValue.text.split(',');
                    List<String> yValues = yValue.text.split(',');
                    // if (xValues.isNotEmpty || yValues.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => viewChart(
                          chartType: providerdropdowns.dropdownValue,
                          xValue: xValues,
                          yValue: yValues,
                        ),
                      ),
                    );
                    // }
                    ;
                  },
                  child: const Text(
                    'Show Chart',
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
                  onPressed: () {},
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
      ),
    );
  }
}
