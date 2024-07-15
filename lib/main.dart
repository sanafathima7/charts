// import 'package:charts/homepage.dart';
// import 'package:charts/mainhomepage.dart';
// import 'package:charts/provider/provider.dart';
// import 'package:charts/provider/providerbottom.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:hive/hive.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   var directory = await getApplicationDocumentsDirectory();
//   Hive.init(directory.path);
//   await Hive.initFlutter();
//   //  Hive.registerAdapter(ChartDataAdapter()); // Register your adapters here if you have any

//   runApp(MultiProvider(providers: [
//     ChangeNotifierProvider(create: (context) => providerdropdown()),
//     ChangeNotifierProvider(
//         create: (context) => NavigationProvider(
//               chartType: '',
//               xValue: [],
//               yValue: [],
//             )),
//   ], child: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home:
//           // viewChart(),
//           mainHomepage(),
//     );
//   }
// }
import 'package:charts/homepage.dart';
import 'package:charts/mainhomepage.dart';
import 'package:charts/provider/provider.dart';
import 'package:charts/provider/providerbottom.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:charts/chart_data1.dart' as chartData1Package;
import 'package:charts/chart_data.dart' as chartDataPackage;
import 'package:charts/chart_data2.dart' as chartData2Package;

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
