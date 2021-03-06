import 'package:flutter/material.dart';
import 'package:hear_better/models/audiogram.dart';
import 'package:hear_better/theme/colors.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

Audiogram audiogram1;
double rightEarPercentage = 0;
double leftEarPercentage = 0;
String earMessage = "According to your test your hear better with your, ";
String earResults = "----";

class HistoricEarResults extends StatefulWidget {
  @override
  _HistoricEarResultsState createState() => _HistoricEarResultsState();
  HistoricEarResults(Audiogram audiogram) {
    audiogram1 = audiogram;
  }
}

class _HistoricEarResultsState extends State<HistoricEarResults> {
  void comparingEars(List rightEar, List leftEar) {
    setState(() {
      double rightEarCounter = 0;
      double leftEarCounter = 0;
      for (int i = 0; i < rightEar.length; i++) {
        if (leftEar[i] < rightEar[i]) {
          leftEarCounter++;
        } else if (rightEar[i] < leftEar[i]) {
          rightEarCounter++;
        } else {
          rightEarCounter++;
          leftEarCounter++;
        }
      }
      rightEarPercentage = rightEarCounter / rightEar.length;
      print(rightEarPercentage);
      leftEarPercentage = leftEarCounter / leftEar.length;
      print(leftEarPercentage);
      if (rightEarPercentage > leftEarPercentage) {
        earResults = earMessage +
            "right ear \n Which is " +
            ((rightEarPercentage * 100).round()).toString() +
            "% superior to your left ear";
      } else if (leftEarPercentage > rightEarPercentage) {
        earResults = earMessage +
            "left ear \n Which is " +
            ((leftEarPercentage * 100).round()).toString() +
            "% superior to your right ear";
      } else
        earResults = " Both your ears have the same hearing percentage";
    });
  }

  @override
  Widget build(BuildContext context) {
    comparingEars(audiogram1.rightEar, audiogram1.leftEar);
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            "This is the results of which ear you hear better with according to your test ",
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
            child: LinearPercentIndicator(
              animation: true,
              animationDuration: 1000,
              lineHeight: 30,
              leading: Padding(
                padding: EdgeInsets.only(right: 15),
                child: Text(
                  "Right ear",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              progressColor: AppColors().primaryRed,
              linearStrokeCap: LinearStrokeCap.roundAll,
              percent: rightEarPercentage,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 25, 0, 20),
            child: LinearPercentIndicator(
              animation: true,
              animationDuration: 1000,
              lineHeight: 30,
              leading: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Text("Left ear ", style: TextStyle(fontSize: 18)),
              ),
              progressColor: AppColors().primaryBlue,
              linearStrokeCap: LinearStrokeCap.roundAll,
              percent: leftEarPercentage,
            ),
          ),
          Text(
            earResults,
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
