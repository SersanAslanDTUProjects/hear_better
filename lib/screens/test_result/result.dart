import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:hear_better/models/audiogram.dart';
import 'package:hear_better/screens/hearingtest/result/LineChart.dart';
import '../hearingtest/result/comparing_results.dart';

class ResultScreen extends StatelessWidget {
  final List<charts.Series> seriesList = createData();
  final bool animate = true;

  final testGraf = new Audiogram();

  static List<charts.Series<TestAudiogram, String>> createData() {
    final random = Random();
    final audiogramData = [
      TestAudiogram(10, random.nextInt(8000)),
      TestAudiogram(20, random.nextInt(8000)),
      TestAudiogram(30, random.nextInt(8000)),
      TestAudiogram(40, random.nextInt(8000)),
      TestAudiogram(50, random.nextInt(8000)),
      TestAudiogram(80, random.nextInt(8000)),
    ];

    return [
      charts.Series<TestAudiogram, String>(
        id: 'Audiogram',
        domainFn: (TestAudiogram testAudiogram, _) =>
            testAudiogram.frequency.toString(),
        measureFn: (TestAudiogram testAudiogram, _) => testAudiogram.decibel,
        data: audiogramData,
      )
    ];
  }

  barChart() {
    return charts.BarChart(
      seriesList,
      animate: true,
      vertical: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Center(
                  child: Container(
                width: 200,
                height: 200,
                child: Results(audiogram),
              ))),
          Container(
            width: 250,
            height: 250,
            child: NumericComboLinePointChart.withSampleData(audiogram),
          ),
          Container(
            child: Image(
              image: AssetImage('assets/images/result-screen/Full-Green.png'),
            ),
          ),
          Container(
            child: Image(
              image: AssetImage('assets/images/result-screen/Full-Blue.png'),
            ),
          )
        ],
      ),
    );
  }
}

class TestAudiogram {
  int decibel;
  int frequency;

  TestAudiogram(this.decibel, this.frequency);
}
