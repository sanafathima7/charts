import 'package:hive/hive.dart';

part 'chart_data.g.dart';

@HiveType(typeId: 0)
class ChartData extends HiveObject {
  @HiveField(0)
  late String chartType;

  @HiveField(1)
  late List<String> xValue;

  @HiveField(2)
  late List<String> yValue;

  ChartData(
      {required this.chartType, required this.xValue, required this.yValue});
}
