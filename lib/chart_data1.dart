import 'package:hive/hive.dart';

part 'chart_data1.g.dart';

@HiveType(typeId: 1)
class ChartData1 extends HiveObject {
  @HiveField(0)
  late String chartType;

  @HiveField(1)
  late List<String> xValue;

  ChartData1({
    required this.chartType,
    required this.xValue,
  });
}
