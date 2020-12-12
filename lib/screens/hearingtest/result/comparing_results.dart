import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hear_better/models/audiogram.dart';
import 'package:hear_better/theme/app_theme.dart';
import 'package:hear_better/theme/colors.dart';
import 'package:percent_indicator/percent_indicator.dart';

double userTestResult = 0;
double upperBoundForIdealHearing = 0.60;
double lowHearing = 0.25;
String resultsOfHearing = "----";
Color color = Colors.grey;
Audiogram audiogram;

class Results extends StatefulWidget {
  Results(Audiogram audiogram2) {
    audiogram = audiogram2;
  }
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  String displayTextOfResult(double userTestResult) {
    setState(() {
      if (userTestResult <= lowHearing) {
        resultsOfHearing =
            "Your hearing needs medical attention. Please seek doctor";
        color = AppColors().netflixRed;
      } else if (userTestResult > lowHearing &&
          userTestResult < upperBoundForIdealHearing) {
        resultsOfHearing = "Your hearing is normal";
        color = AppColors().primaryYellow;
      } else if (userTestResult >= upperBoundForIdealHearing) {
        resultsOfHearing = "Very good hearing! Keep up!";
        color = AppColors().spotifyGreen;
      } else if (userTestResult < lowHearing) {
        resultsOfHearing = "Seek doctor immediatly!";
        color = AppColors().netflixRed;
      }
    });
    return resultsOfHearing;
  }

  @override
  Widget build(BuildContext context) {
    calculateUserScore(audiogram.rightEar, audiogram.leftEar);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              "This is the result of your hearing test ",
              style: TextStyle(
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Center(
                child: Text(
                  displayTextOfResult(userTestResult),
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            LinearPercentIndicator(
              animation: true,
              animationDuration: 1000,
              lineHeight: 30,
              leading: Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(
                  Icons.thumb_down,
                  color: AppTheme.colors.netflixRed,
                ),
              ),
              trailing: Padding(
                padding: EdgeInsets.only(left: 15),
                child: Icon(
                  Icons.thumb_up,
                  color: AppTheme.colors.spotifyGreen,
                ),
              ),
              progressColor: color,
              percent: userTestResult,
              linearStrokeCap: LinearStrokeCap.roundAll,
            ),
          ],
        ),
      ),
    );
  }
}

void calculateUserScore(List leftEar, List rightEar) {
  int goodHearing = 0;
  for (int i = 0; i < leftEar.length; i++) {
    if (leftEar[i] <= 20) {
      goodHearing++;
    }
    if (rightEar[i] <= 20) {
      goodHearing++;
    }
  }
  userTestResult = goodHearing / 12;
  if (userTestResult == 0.0) {
    userTestResult = 0.05;
  }
}
