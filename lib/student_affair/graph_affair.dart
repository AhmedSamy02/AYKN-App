import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:yarab/components/crud.dart';
import 'package:yarab/constant/linkapi.dart';
import 'package:yarab/main.dart';

class graph_affair extends StatefulWidget {
  const graph_affair({super.key});

  @override
  State<graph_affair> createState() => _graph_affairState();
}

class _graph_affairState extends State<graph_affair> with Crud {
  TooltipBehavior _tooltipBehavir = new TooltipBehavior();
  count() async {
    var response = await postRequest(linkcountinststd, {});
    return response;
  }

  coursetoexam() async {
    var response = await postRequest(linkcoursetoexam, {});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statstics'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            FutureBuilder(
              future: count(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                int countStd = 0, countInst = 0;

                List<Pair<String, int>> sales = [Pair('instructor count', 0)];
                //List<Pair<String,int>>

                if (snapshot.data == null)
                  print('this null');
                else {
                  sales[0] = Pair(
                      'student count', int.parse(snapshot.data['data'][0]['stdCount']));
                  sales.add(
                    Pair('instructor count',
                        int.parse(snapshot.data['data'][0]['instCount'])),
                  );
                }
                return Column(
                  children: [
                    SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      // Chart title
                      title:
                          ChartTitle(text: 'number of users signed in the app'),
                      // Enable legend
                      legend: Legend(isVisible: true),
                      // Enable tooltip
                      tooltipBehavior: _tooltipBehavir,
                      series: <ChartSeries<Pair, String>>[
                        BarSeries<Pair, String>(
                            dataSource: sales,
                            xValueMapper: (Pair sales, _) => sales.a,
                            yValueMapper: (Pair sales, _) => sales.b,
                            enableTooltip: true,
                            name: 'Sales',
                            // Enable data label
                            dataLabelSettings:
                                DataLabelSettings(isVisible: true)),
                      ],
                    ),
                  ],
                );
              },
            ),
            FutureBuilder(
              future: coursetoexam(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                List<Pair<String, int>> sales = [Pair('instructor count', 0)];
                //List<Pair<String,int>>

                if (snapshot.data == null)
                  print('this null');
                else {
                  sales.clear();
                  for (var i = 0; i < snapshot.data['data'].length; i++) {
                    sales.add(Pair(
                        snapshot.data['data'][i][
                                '(SELECT course_name FROM course WHERE course_id=p )']
                            .toString(),
                        int.parse(snapshot.data['data'][i]['COUNT(*)'])));
                  }
                }
                return Column(
                  children: [
                    SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      // Chart title
                      title:
                          ChartTitle(text: 'number of users signed in the app'),
                      // Enable legend
                      legend: Legend(isVisible: true),
                      // Enable tooltip
                      tooltipBehavior: _tooltipBehavir,
                      series: <ChartSeries<Pair, String>>[
                        BarSeries<Pair, String>(
                            dataSource: sales,
                            xValueMapper: (Pair sales, _) => sales.a,
                            yValueMapper: (Pair sales, _) => sales.b,
                            enableTooltip: true,
                            name: 'Sales',
                            // Enable data label
                            dataLabelSettings:
                                DataLabelSettings(isVisible: true)),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
