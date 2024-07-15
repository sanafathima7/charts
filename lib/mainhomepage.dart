import 'package:charts/custom_container.dart';
import 'package:charts/provider/provider.dart';
import 'package:charts/provider/providerbottom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class mainHomepage extends StatelessWidget {
  mainHomepage({
    super.key,
  });

  final TextEditingController xValue = TextEditingController();

  final TextEditingController yValue = TextEditingController();

  // final TextEditingController chartType = TextEditingController();

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
                  )),
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
            // ElevatedButton(onPressed: () {}, child: Text('Go')),
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
            customContainer(
              xValue: xValue,
              yValue: yValue,
              chartType: providerdropdowns.dropdownValue,
            ),
            const SizedBox(
              height: 30,
            ),
            Consumer<NavigationProvider>(
              builder: (BuildContext context, NavigationProvider value,
                  Widget? child) {
                return BottomNavigationBar(
                    onTap: (index) {
                      // if (index == '1') {
                      //   // if (providerdropdowns.navigationProvider.indexed[1]) {
                      //   List<String> xValues = xValue.text.split(',');
                      //   List<String> yValues = yValue.text.split(',');
                      //   if (xValues.isNotEmpty || yValues.isNotEmpty) {
                      //     // providerNavigation.viewChartFunction(context);
                      //     providerNavigations.updatedValue(
                      //       context: context,
                      //       // context: context,
                      //       xValue: xValues,
                      //       yValue: yValues,
                      //       chartType: providerdropdowns.dropdownValue,
                      //     );
                      //   }
                      // }
                      //else {

                      List<String> xValues = xValue.text.split(',');
                      List<String> yValues = yValue.text.split(',');
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
                          ));
                    },
                    currentIndex: providerNavigations.myIndex,
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: 'home'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.insert_chart), label: 'View charts'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.saved_search),
                          label: 'Saved charts'),
                    ]);

                // onTap: Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     ElevatedButton(
                //       onPressed: () {
                //         List<String> xValues = xValue.text.split(',');
                //         List<String> yValues = yValue.text.split(',');
                //         // if (xValues.isNotEmpty || yValues.isNotEmpty) {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => viewChart(
                //               chartType: providerdropdowns.dropdownValue,
                //               xValue: xValues,
                //               yValue: yValues,
                //             ),
                //           ),
                //         );
                //         // }
                //         ;
                //       },
                //       child: const Text(
                //         'Show Chart',
                //         style: TextStyle(
                //           fontWeight: FontWeight.bold,
                //           fontSize: 16,
                //         ),
                //       ),
                //     ),
                //     const SizedBox(
                //       width: 50,
                //     ),
                //     ElevatedButton(
                //       onPressed: () {},
                //       child: const Text(
                //         'Save Chart',
                //         style: TextStyle(
                //           fontWeight: FontWeight.bold,
                //           fontSize: 16,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              },
            )
          ],
        ),
      ),
    );
  }
}
