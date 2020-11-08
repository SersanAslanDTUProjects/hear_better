import 'package:flutter/material.dart';
import 'package:hear_better/screens/hearingtest/result/comparing_results.dart';
import 'package:hear_better/theme/app_theme.dart';

import 'LineChart.dart';

class ResultScreenMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.fitWidth,
          alignment: Alignment.bottomCenter,
        ),
      ),
      margin: EdgeInsets.all(0),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          children: <Widget>[
            Container(
                margin: EdgeInsets.fromLTRB(0, 50, 0, 0) ,
                child: Center(
                    child: Container(
                      width: 300,
                      height: 200,
                      child: Results(),
                    )
                )
            ),
            Container(
              padding: EdgeInsets.all(30),
              width: 200,
              height: 250,
              child: NumericComboLinePointChart.withSampleData(),
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
      ),
    );
  }
}
