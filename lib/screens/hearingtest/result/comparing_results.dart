import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Results extends StatefulWidget {
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  double userTestResult = 60 / 100; //get from test_result
  double normalHearing = 0.5; //what is the interval for a normal hearing
  double lowHearing = 0.3;
  double goodHearing = 1;
  String resultsOfHearing = "----";
  Color color = Colors.grey;

  String displayTextOfResult(double userTestResult) {
    setState(() {
      if (userTestResult < lowHearing) {
        this.resultsOfHearing = "Pls see doctor";
        color = Colors.red;
      } else if (userTestResult > normalHearing) {
        this.resultsOfHearing = "Very good hearing! Keep up";
        color = Colors.green;
      }
    });
    return resultsOfHearing;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: Center(
                  child: Text(
                    displayTextOfResult(userTestResult),
                    style: TextStyle(
                      fontSize: 28.0,
                    ),
                  ),
                )),
            LinearPercentIndicator(
              lineHeight: 30,
              progressColor: color,
              backgroundColor: Colors.grey,
              percent: userTestResult,
              animation: true,
              linearStrokeCap: LinearStrokeCap.butt,
            )
          ],
        ),
      ),
    );
  }
}
