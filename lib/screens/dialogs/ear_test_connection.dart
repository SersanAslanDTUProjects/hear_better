import 'package:flutter/material.dart' hide Router;
import 'package:hear_better/theme/routes/router.gr.dart';
import 'package:audioplayers/audio_cache.dart';

import 'cancel_test.dart';

class EarTest extends StatefulWidget {
  @override
  _EarTestState createState() => _EarTestState();
}

class _EarTestState extends State<EarTest> {
  String testingEar = "assets/images/test_connection_images/rightEar.png";

  AudioCache audioCache = AudioCache();

  int soundPlayed = 0;

  playLocal() async {
    if (soundPlayed != 2) {
      await audioCache.play('sounds/beep.mp3');
      soundPlayed++;
    }
    audioCache.clear('beep.mp3');
  }

  void leftEarTest() {
    setState(() {
      this.testingEar = "assets/images/test_connection_images/leftEar.png";
    });
  }

  @override
  Widget build(BuildContext context) {
    playLocal();
    return AlertDialog(
        title: Text(
          "Testing connection",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30),
        ),
        content: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.asset(testingEar, alignment: Alignment.center),
              ),
              Align(
                child: Text(
                  "Do you hear the sound?",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        //Think there is a better way ^
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) =>
                              CancelDialog(context),
                          //should eliminate itself
                        );
                      },
                      child: Image.asset(
                          'assets/images/test_connection_images/no.png')),
                  FlatButton(
                    onPressed: () {
                      if (testingEar ==
                          "assets/images/test_connection_images/leftEar.png") {
                        Router.navigator.pushNamed(
                            Router.hearingTestPreperationStartTestScreenMobile);
                      }

                      leftEarTest();
                    },
                    child: Image.asset(
                        'assets/images/test_connection_images/yes.png'),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
