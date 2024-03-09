import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


class Performancegraph extends StatefulWidget {
  const Performancegraph({super.key});

  @override
  State<Performancegraph> createState() => _PerformancegraphState();
}
//  fl_chart: ^0.60.0
// sdk: '>=3.1.5 <4.0.0'
class _PerformancegraphState extends State<Performancegraph> {

  final List<String> studentNames = [
    'Student 1: shailesh',
    'Student 2: vaghela',
    'Student 3: flutter',
    'Student 4: developer',
    'Student 5: shailesh vaghela',
    'Student 6',
    'Student 7',
    'Student 8',
    'Student 9',
    'Student 10',
    'Student 11',
    'Student 12',
    'Student 13',
    'Student 14',
    'Student 15',
    'Student 16',
    'Student 17',
    'Student 18',
    'Student 19',
    'Student 20',
  ];

  final List<double> examMarks = [
    80,
    90,
    75,
    60,
    85,
    78,
    92,
    88,
    70,
    95,
    82,
    77,
    65,
    89,
    93,
    72,
    68,
    84,
    79,
    97,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Exam Performance'),
      ),
      body:  SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: studentNames.length * 150.0, // Width of the chart based on the number of students
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                groupsSpace: 12.0,
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles:true, reservedSize: 40,),

                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles:true, reservedSize: 40,
                        getTitlesWidget:(value, meta) {
                          if (value.toInt() >= 0 && value.toInt() < studentNames.length) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(studentNames[value.toInt()],style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),),
                            );
                          }
                          return Text('');

                        },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                barGroups: examMarks
                    .asMap()
                    .entries
                    .map((entry) => BarChartGroupData(
                  x: entry.key,
                  barRods: [
                    BarChartRodData(
                      toY: entry.value,
                      color: Colors.green,
                    ),
                  ],
                ))
                    .toList(),
              ),
            ),
          ),
        ),
      )
    );
  }
}
