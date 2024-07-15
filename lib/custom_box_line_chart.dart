import 'package:charts/chart_data.dart';
import 'package:charts/widgets/charts/linechart.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class custom_box_line_chart extends StatelessWidget {
  const custom_box_line_chart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Box<ChartData>>(
      future: Hive.openBox<ChartData>('chartsData'),
      builder: (BuildContext context, AsyncSnapshot<Box<ChartData>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          var box = snapshot.data;
          if (box != null && box.isNotEmpty) {
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                var chartData = box.getAt(index);
                if (chartData != null &&
                    chartData.chartType == 'line chart 1') {
                  return ListTile(
                    title: Center(
                      child: Container(
                        height: 45,
                        child: Text(
                          chartData.chartType,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    subtitle: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        height: 300,
                        width: 300,
                        child: Container(
                          height: 200,
                          width: 400,
                          // decoration: BoxDecoration(
                          //     border: Border.all(
                          //   color: Colors.black,
                          // )),
                          child: LineChartDatas(
                            xValue: chartData.xValue,
                            yValue: chartData.yValue,
                          ),
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
