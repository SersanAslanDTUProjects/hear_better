import 'package:flutter/material.dart' hide Router;
import 'package:hear_better/models/audiogram.dart';
import 'package:hear_better/screens/hearingtest/result/comparing_Ears.dart';
import 'package:hear_better/screens/hearingtest/result/comparing_results.dart';
import 'package:hear_better/theme/app_theme.dart';
import 'package:hear_better/theme/routes/router.gr.dart';

import '../../../widget/audiogram/LineChart.dart';

class HistoricResult extends StatefulWidget {
  final Audiogram audiogram;

  const HistoricResult({@required this.audiogram});
  @override
  _HistoricResultState createState() => _HistoricResultState(audiogram);
}

class _HistoricResultState extends State<HistoricResult> {
  final Audiogram audiogram;

  _HistoricResultState(this.audiogram);

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
              margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Center(
                child: Container(
                  width: 300,
                  height: 200,
                  child: Results(audiogram),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 30, 30, 10),
              width: 200,
              height: 400,
              child: NumericComboLinePointChart.withSampleData(audiogram),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Center(
                child: Container(
                  width: 300,
                  height: 315,
                  child: EarResults(audiogram),
                ),
              ),
            ),
            Container(
              child: ListTile(
                title: Row(
                  children: [
                    Expanded(
                      child: RaisedButton(
                        color: AppTheme.colors.primaryBlue,
                        onPressed: () {
                          Navigator.of(context)
                              .popUntil(ModalRoute.withName(Router.wrapper));
                        },
                        child: Text(
                          'Close',
                          style: TextStyle(
                            fontSize: 20,
                            color: AppTheme.colors.white,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
