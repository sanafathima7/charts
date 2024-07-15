import 'package:charts/model/chart_data2.dart';
import 'package:charts/widgets/charts/barchart.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class custom_box2_bar_chart extends StatelessWidget {
  const custom_box2_bar_chart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Box<ChartData2>>(
      future: Hive.openBox<ChartData2>('chartsData2'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          var box2 = snapshot.data;
          if (box2 != null && box2.isNotEmpty) {
            return ListView.builder(
              itemCount: box2.length,
              itemBuilder: (context, index) {
                var chartData2 = box2.getAt(index);
                if (chartData2 != null &&
                    chartData2.chartType == 'bar chart 1') {
                  return ListTile(
                    title: Center(
                      child: Container(
                        height: 50,
                        child: Text(
                          chartData2.chartType,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    subtitle: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        height: 300,
                        child: Container(
                          height: 200,
                          width: 400,
                          child: BarChartDatas(
                            xValue: chartData2.xValue,
                            yValue: chartData2.yValue,
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
