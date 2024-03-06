import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GraphExample extends StatefulWidget {
  const GraphExample({super.key});

  @override
  State<GraphExample> createState() => _GraphExampleState();
}
//  charts_flutter: ^0.12.0
class _GraphExampleState extends State<GraphExample> {
  final List<DeveloperSeries> data = [

    DeveloperSeries(
      year: 2017,
      developers: 40000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: 2018,
      developers: 5000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: 2019,
      developers: 40000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: 2020,
      developers: 35000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: 2021,
      developers: 45000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: DeveloperChart(
            data: data,
          )
      ),
    );
  }
}
class DeveloperChart extends StatelessWidget {
  final List<DeveloperSeries> data;

  DeveloperChart({required this.data});
  @override
  Widget build(BuildContext context) {
    List<charts.Series<DeveloperSeries, String>> series = [
      charts.Series(
          id: "developers",
          data: data,
          domainFn: (DeveloperSeries series, _) => series.year.toString(),
          measureFn: (DeveloperSeries series, _) => series.developers,
          colorFn: (DeveloperSeries series, _) => series.barColor
      )
    ];

    return Container(
      height: 300,
      padding: EdgeInsets.all(25),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            children: <Widget>[
              Text(
                "Yearly Growth in the Flutter Community",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Expanded(
                child: charts.BarChart(series, animate: true),
              )
            ],
          ),
        ),
      ),
    );
  }

}
class DeveloperSeries {
  final int year;
  final int developers;
  final charts.Color barColor;

  DeveloperSeries(
      {
        required this.year,
        required this.developers,
        required this.barColor
      }
      );
}
