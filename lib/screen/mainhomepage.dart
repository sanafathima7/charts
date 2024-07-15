import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charts/widgets/custom_container.dart';
import 'package:charts/provider/provider.dart';
import 'package:charts/provider/providerbottom.dart';

class mainHomepage extends StatefulWidget {
  mainHomepage({Key? key}) : super(key: key);

  @override
  _MainHomepageState createState() => _MainHomepageState();
}

class _MainHomepageState extends State<mainHomepage> {
  final TextEditingController xValue = TextEditingController();
  final TextEditingController yValue = TextEditingController();

  void customAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('Enter the same number of points for X and Y values.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final providerdropdowns = Provider.of<providerdropdown>(context);
    final providerNavigations = Provider.of<NavigationProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 2),
              child: Container(
                height: 80,
                child: const Card(
                  color: Color.fromARGB(255, 149, 235, 152),
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
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Hi, Unknown',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                shape: BoxShape.rectangle,
                border: Border.all(
                  style: BorderStyle.solid,
                  color: Colors.black26,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 25),
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
              height: 12,
            ),
            Text(
              'Demo Chart',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            if (providerdropdowns.dropdownValue != 'Pie Chart')
              customContainer(
                xValue: xValue,
                yValue: yValue,
                chartType: providerdropdowns.dropdownValue,
              ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Consumer<NavigationProvider>(
        builder:
            (BuildContext context, NavigationProvider value, Widget? child) {
          return BottomNavigationBar(
            onTap: (index) {
              if (providerdropdowns.dropdownValue != 'Pie Chart') {
                List<String> xValues = xValue.text.split(',');
                List<String> yValues = yValue.text.split(',');

                if (xValues.length != yValues.length) {
                  customAlert(context);
                } else {
                  // Navigate to the selected screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          providerNavigations.navigationProvider(
                        context,
                        index,
                        chartType: providerdropdowns.dropdownValue,
                        xValue: xValues,
                        yValue: yValues,
                      ),
                    ),
                  );
                }
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        providerNavigations.navigationProvider(
                      context,
                      index,
                      chartType: providerdropdowns.dropdownValue,
                      xValue: [],
                      yValue: [],
                    ),
                  ),
                );
              }
            },
            currentIndex: providerNavigations.myIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.insert_chart), label: 'View Charts'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.saved_search), label: 'Saved Charts'),
            ],
          );
        },
      ),
    );
  }
}
