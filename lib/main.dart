import 'package:charts/screen/mainhomepage.dart';
import 'package:charts/provider/provider.dart';
import 'package:charts/provider/providerbottom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:charts/model/chart_data1.dart' as chartData1Package;
import 'package:charts/model/chart_data.dart' as chartDataPackage;
import 'package:charts/model/chart_data2.dart' as chartData2Package;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Hive.initFlutter();
    Hive.registerAdapter(chartDataPackage.ChartDataAdapter());
    Hive.registerAdapter(chartData1Package.ChartData1Adapter());
    Hive.registerAdapter(chartData2Package.ChartData2Adapter());

    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => providerdropdown()),
        ChangeNotifierProvider(
          create: (context) => NavigationProvider(
            chartType: '',
            xValue: [],
            yValue: [],
          ),
        ),
      ],
      child: MyApp(),
    ));
  } catch (e) {
    print('Initialization Error: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: mainHomepage(),
    );
  }
}
