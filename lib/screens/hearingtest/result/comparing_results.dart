import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hear_better/models/test_result.dart';
import 'package:hear_better/theme/colors.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Results extends StatefulWidget {
  @override
  _ResultsState createState() => _ResultsState();
}
double userTestResult = 60 / 100; //get from test_result
double normalHearing = 0.5; //what is the interval for a normal hearing
double lowHearing = 0.3;
double goodHearing = 1;
String resultsOfHearing = "----";
Color color = Colors.grey;
class _ResultsState extends State<Results> {
  String displayTextOfResult(double userTestResult) {
    setState(() {
      if (userTestResult <= lowHearing) {
        resultsOfHearing =
            "Your hearing needs medical attention. Please seek doctor";
        color = AppColors().primaryRed;
      } else if (userTestResult >= lowHearing &&
          userTestResult <= normalHearing) {
        resultsOfHearing = "Your hearing is normal";
        color = AppColors().primaryYellow;
      } else if (userTestResult >= normalHearing) {
        resultsOfHearing = "Very good hearing! Keep up!";
        color = AppColors().primaryGreen;
      }
    });
    return resultsOfHearing;
  }

  @override
  Widget build(BuildContext context) {
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
                child: Icon(Icons.close),
              ),
              trailing: Padding(
                padding: EdgeInsets.only(left: 15),
                child: Icon(Icons.insert_emoticon),
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
