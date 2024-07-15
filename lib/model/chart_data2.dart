import 'package:hive/hive.dart';

part 'chart_data2.g.dart';

@HiveType(typeId: 2)
class ChartData2 extends HiveObject {
  @HiveField(0)
  late String chartType;

  @HiveField(1)
  late List<String> xValue;

  @HiveField(2)
  late List<String> yValue;

  ChartData2(
      {required this.chartType, required this.xValue, required this.yValue});
}
