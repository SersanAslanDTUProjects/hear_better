import 'package:flutter/material.dart';
import 'package:hear_better/models/audiogram.dart';
import 'package:hear_better/screens/hearingtest/result/comparing_results.dart';
import 'package:hear_better/theme/colors.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

Audiogram audiogram1;
double rightEarPercentage = 0;
double leftEarPercentage = 0;
String earMessage = "According to your test your hear better with your ";
String earResults = "----";

class EarResults extends StatefulWidget {
  @override
  _EarResultsState createState() => _EarResultsState();
  EarResults(Audiogram audiogram) {
    audiogram1 = audiogram;
  }
}

class _EarResultsState extends State<EarResults> {
  void comparingEars(List rightEar, List leftEar) {
    setState(() {
      calculateEarsResults(rightEar, leftEar);
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
              trailing: Padding(
                padding: EdgeInsets.only(left: 15),
                child:
                    Text((rightEarPercentage * 100).round().toString() + "% "),
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
              trailing: Padding(
                padding: EdgeInsets.only(left: 15),
                child:
                    Text((leftEarPercentage * 100).round().toString() + "% "),
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

void calculateEarsResults(List rightEar, List leftEar) {
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
        "right ear \n Which scored " +
        ((rightEarPercentage * 100).round()).toString() +
        "% compared to your left ear";
  } else if (leftEarPercentage > rightEarPercentage) {
    earResults = earMessage +
        "left ear \n Which scored " +
        ((leftEarPercentage * 100).round()).toString() +
        "% compared to your right ear";
  } else
    earResults = " Both your ears have the same hearing percentage";
}
