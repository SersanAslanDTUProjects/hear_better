import 'dart:async';

import 'package:flutter/material.dart' hide Router;
import 'package:flutter/services.dart';
import 'package:hear_better/screens/hearingtest/result/result_screen.dart';
import 'package:hear_better/theme/app_theme.dart';
import 'package:hear_better/theme/routes/router.gr.dart';
import 'package:audioplayers/audio_cache.dart';

class HearingTestMobileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.close),
                    color: AppTheme.colors.primaryBlue,
                  ),
                ],
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.fromLTRB(50, 40, 50, 50),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: 50.0),
                                child: TestProgressIndicator(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 150),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FlatButton(
                              onPressed: () => null,
                              onLongPress: () {
                                HapticFeedback.mediumImpact();
                                // TODO add secondary feed back if vibration not enabled or inform user enable vibration when boarding the app
                              },
                              child: Icon(
                                Icons.hearing,
                                size: 150.0,
                                color: AppTheme.colors.primaryBlue,
                              ), // TODO animation or better icon
                            ),
                          ],
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

class TestProgressIndicator extends StatefulWidget {
  @override
  _TestProgressIndicatorState createState() => _TestProgressIndicatorState();
}

class _TestProgressIndicatorState extends State<TestProgressIndicator> {
  double progress = 0;

  AudioCache audioCache = AudioCache();
  playLocal() async {
    await audioCache.play('sounds/beep.mp3');
    audioCache.clear('beep.mp3');
  }

  // TODO make timer functionality external?
  void startTimer(BuildContext context) {
    new Timer(Duration(seconds: 1, milliseconds: 2), () {
      playLocal();
      setState(() {
        if (progress == 1) {
          Router.navigator.pushNamed(Router.resultScreen);
          progress++;
          // TODO navigate to results here?
        } else {
          progress += 0.2;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (progress <= 1) {
      startTimer(context);
    }
    return LinearProgressIndicator(
      value: progress,
      valueColor: AlwaysStoppedAnimation<Color>(AppTheme.colors.primaryGreen),
    );
  }
}
