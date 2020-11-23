import 'dart:async';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter/services.dart';
import 'package:hear_better/theme/app_theme.dart';
import 'package:hear_better/theme/routes/router.gr.dart';
import 'package:audioplayers/audio_cache.dart';

class HearingTestMobileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;

    Future<bool> onWillPop() async {
      return (await showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              title: new Text('Stop the test?'),
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

    return Scaffold(
      body: SafeArea(
        child: WillPopScope(
          onWillPop: onWillPop,
          child: Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () => onWillPop(),
                      icon: Icon(Icons.close),
                      color: AppTheme.colors.primaryBlue,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(50, 60, 50, 50),
                  child: TestProgressIndicator(),
                ),
              ],
            ),
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

  @override
  Widget build(BuildContext context) {
    playLocal();

    return
      Container(
        child: Column(
          children: <Widget>[
            Container(
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 50.0),
                    child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 7,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            AppTheme.colors.primaryGreen)),
                  ),
            SizedBox(height: 120),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 175,
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          if (progress == 0.8) {
                            Router.navigator.pushReplacementNamed(Router.resultScreen);
                            progress = 0;
                          } else {
                            playLocal();
                            progress += 0.2;
                          }
                        });
                      },
                      child: Icon(
                        Icons.hearing,
                        size: 175,
                        color: AppTheme.colors.primaryBlue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}
