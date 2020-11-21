import 'package:flutter/material.dart' hide Router;
import 'package:hear_better/models/audiogram.dart';
import 'package:hear_better/models/hbuser.dart';
import 'package:hear_better/screens/hearingtest/result/comparing_ears.dart';
import 'package:hear_better/screens/hearingtest/result/comparing_results.dart';
import 'package:hear_better/services/database.dart';
import 'package:hear_better/theme/app_theme.dart';
import 'package:hear_better/theme/routes/router.gr.dart';
import 'package:provider/provider.dart';

import 'LineChart.dart';

class ResultScreenMobile extends StatefulWidget {
  @override
  _ResultScreenMobileState createState() => _ResultScreenMobileState();
}

class _ResultScreenMobileState extends State<ResultScreenMobile> {
  final Audiogram audiogram = new Audiogram();

  bool _isVisible = false;

  void showSaveButton(HBUser user) {
    setState(() {
      if (user != null) {
        _isVisible = !_isVisible;
      }
    });
  }

  Future<bool> onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Exit Result?'),
            content: new Text('Sure?'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Router.navigator.pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context)
                    .popUntil(ModalRoute.withName(Router.wrapper)),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<HBUser>(context);
    showSaveButton(user);
    return WillPopScope(
      onWillPop: onWillPop,
      child: Container(
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
                      SizedBox(width: 10),
                      Visibility(
                        visible: _isVisible,
                        child: Container(
                          child: Expanded(
                            child: RaisedButton(
                              color: AppTheme.colors.primaryGreen,
                              onPressed: () async {
                                try {
                                  await DatabaseService(uid: user.uid)
                                      .addAudiogramData(audiogram: audiogram);
                                } catch (e) {
                                  print('need a toast to show error ');
                                } finally {
                                  print(
                                      'show toast when succeed and disable save button');
                                  //TODO: Fix hide/show button
                                  showSaveButton(user);
                                }
                              },
                              child: Text(
                                'Save Result',
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
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
