import 'package:charts/provider/providerbottom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final TextEditingController xValue = TextEditingController();

  final TextEditingController yValue = TextEditingController();

  final TextEditingController chartType = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
  }
}
