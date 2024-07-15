import 'package:charts/chart_data1.dart';
import 'package:charts/widgets/charts/piechart.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class custom_box1_pie_chart extends StatelessWidget {
  const custom_box1_pie_chart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Box<ChartData1>>(
      future: Hive.openBox<ChartData1>('chartsData1'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          var box1 = snapshot.data;
          if (box1 != null && box1.isNotEmpty) {
            return ListView.builder(
              itemCount: box1.length,
              itemBuilder: (context, index) {
                var chartData1 = box1.getAt(index);
                if (chartData1 != null &&
                    chartData1.chartType == 'pie chart 1') {
                  return ListTile(
                    title: Center(
                      child: Container(
                        height: 35,
                        child: Text(chartData1.chartType,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    subtitle: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        height: 300,
                        child: Container(
                          height: 200,
                          width: 250,
                          child: PieChartDatas(xValue: chartData1.xValue),
                        ),
                      ),
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            );
          } else {
            return Center(
              child: Text('No saved charts'),
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
