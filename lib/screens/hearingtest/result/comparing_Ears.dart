import 'package:flutter/material.dart';
import 'package:hear_better/models/audiogram.dart';
import 'package:hear_better/theme/colors.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

Audiogram audiogram1;
double rightEarCounter = 0;
double leftEarCounter = 0;
double rightEarProcent = 0;
double leftEarProcent = 0;
String earResults = "----";

void comparingEars(List rightEar, List leftEar) {
  for (int i = 0; i < rightEar.length; i++) {
    if (leftEar[i] < rightEar[i]) {
      leftEarCounter++;
      print("leftearconuter" + leftEarCounter.toString());
    } else if (rightEar[i] < leftEar[i]) {
      rightEarCounter++;
    } else {
      rightEarCounter++;
      leftEarCounter++;
    }
  }
  print(rightEarCounter);
  print(leftEarCounter);
  rightEarProcent = rightEarCounter / rightEar.length;
  print("rightEarprocent" + rightEarProcent.toString());
  leftEarProcent = leftEarCounter / leftEar.length;
  print("left" + leftEarProcent.toString());

  if (rightEarProcent > leftEarProcent) {
    earResults = " You hear better with your right ear";
  } else if (leftEarProcent > rightEarProcent) {
    earResults = " You hear better with your left ear";
  } else
    earResults = " Both your ears have the same hearing percentage";
}

class EarsResults extends StatelessWidget {
  EarsResults(Audiogram audiogram) {
    audiogram1 = audiogram;
  }

  @override
  Widget build(BuildContext context) {
    comparingEars(audiogram1.rightEar, audiogram1.leftEar);
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            "This is the results of how well you hear with each ear ",
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
              percent: rightEarProcent,
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
              percent: leftEarProcent,
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
