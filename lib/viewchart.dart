import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:charts/mainhomepage.dart';
import 'package:charts/widgets/charts/barchart.dart';
import 'package:charts/widgets/charts/linechart.dart';
import 'package:charts/widgets/charts/piechart.dart';
import 'package:charts/chart_data.dart' as chartDataPackage;
import 'package:charts/chart_data1.dart' as chartData1Package;
import 'package:charts/chart_data2.dart' as chartData2Package;

class ViewChart extends StatefulWidget {
  const ViewChart({
    Key? key,
    required this.chartType,
    required this.xValue,
    required this.yValue,
  }) : super(key: key);

  final String chartType;
  final List<String> xValue;
  final List<String> yValue;

  @override
  _ViewChartState createState() => _ViewChartState();
}

class _ViewChartState extends State<ViewChart> {
  bool _isLoading = false;
  String? _errorMessage;
  int _selectedIndex = 0; // Track the selected bottom navigation bar item

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => mainHomepage(),
        ),
      );
    } else if (index == 1 && !_isLoading) {
      _saveChartData();
    }
  }

  Future<void> _saveChartData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    var box = await Hive.openBox<chartDataPackage.ChartData>('chartsData');
    var chartDataInstance = chartDataPackage.ChartData(
      chartType: widget.chartType,
      xValue: widget.xValue,
      yValue: widget.yValue,
    );
    var box1 = await Hive.openBox<chartData1Package.ChartData1>('chartsData1');
    var chartDataInstance1 = chartData1Package.ChartData1(
      chartType: widget.chartType,
      xValue: widget.xValue,
    );
    var box2 = await Hive.openBox<chartData2Package.ChartData2>('chartsData2');
    var chartDataInstance2 = chartData2Package.ChartData2(
      chartType: widget.chartType,
      xValue: widget.xValue,
      yValue: widget.yValue,
    );

    try {
      await box.add(chartDataInstance);
      await box1.add(chartDataInstance1);
      await box2.add(chartDataInstance2);
    } catch (e) {
      setState(() {
        _errorMessage = 'Error saving chart data: $e';
      });
    } finally {
      await box.close();
      await box1.close();
      await box2.close();

      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 47, 243),
        title: Text(
          'View Chart: ${widget.chartType}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.chartType == 'line chart 1')
              Container(
                height: 400,
                width: 600,
                child: LineChartDatas(
                  xValue: widget.xValue,
                  yValue: widget.yValue,
                ),
              ),
            if (widget.chartType == 'pie chart 1')
              Container(
                height: 400,
                width: 600,
                child: PieChartDatas(xValue: widget.xValue),
              ),
            if (widget.chartType == 'bar chart 1')
              Container(
                height: 400,
                width: 600,
                child: BarChartDatas(
                  xValue: widget.xValue,
                  yValue: widget.yValue,
                ),
              ),
            const SizedBox(height: 20),
            if (_errorMessage != null)
              SizedBox(
                height: 20,
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: 'Go back',
          ),
          BottomNavigationBarItem(
            icon: _isLoading ? CircularProgressIndicator() : Icon(Icons.save),
            label: 'Save Chart',
          ),
        ],
      ),
    );
  }
}
