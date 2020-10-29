import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:hear_better/models/audiogram.dart';


class ResultScreen extends StatelessWidget {
  List<charts.Series> seriesList = createData();

  Audiogram testGraf = new Audiogram();


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

    return [charts.Series<TestAudiogram, String>(
      id: 'Audiogram',
      domainFn: (TestAudiogram testAudiogram, _) => testAudiogram.frequency.toString(),
      measureFn: (TestAudiogram testAudiogram, _ ) => testAudiogram.decibel,
      data: audiogramData,
    )];
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
      appBar: AppBar(
          title: Text('Hear better'),
          centerTitle: true,
          backgroundColor: Colors.blue
      ),
      body: ListView(
        children: <Widget>[
          Container(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 30) ,
              child: Center(
                child: Text(
                  'Your hearing is normal',
                  style: TextStyle(
                    fontSize: 28.0,
                    letterSpacing: 1.0,
                  ),
                ),
              )
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 30),

            child: Image(
              image: AssetImage('assets/images/result-screen/Good.png'),
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(70, 0, 10, 20) ,
                child: Image(
                  image: AssetImage('assets/images/result-screen/solid_light-bulb.png'),
                ),
              ),
              Center(
                child: Text(
                  'Listen to music on lower volume',
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          Image(
            image: AssetImage('assets/images/result-screen/audiogram.png'),
          ),
          Container(
            child:
            //barChart(),
            Image(
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