import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hear_better/screens/test_prep_screens/test_prep_deviceConnection.dart';

class TestNoiceAnalyzation extends StatefulWidget {
  @override
  _TestNoiceAnalyzationState createState() => _TestNoiceAnalyzationState();
}

class _TestNoiceAnalyzationState extends State<TestNoiceAnalyzation> {
  Timer _timer;
  bool _isPressed = true;
  bool _showBtn = false;

  String _analyzingText = 'Checking your \n environment’s noise \n level..';
  AssetImage _analyzingImage =
      new AssetImage('assets/images/test_prep_images/checking_surrounding.png');

  String _succesText = 'Your suroundings are \n quiet enough';
  AssetImage _succesImage =
      new AssetImage('assets/images/test_prep_images/succes_surrounding.png');

  // TODO: This is too long, fix it :-)
  String _failedText = 'Your suroundings are \n too noisy \n' +
      '\n Your environment’s noise level \n is too high to perform an \n accurate hearing test. \n Please move to a quieter place \n and retry';
  AssetImage _failedImage =
      new AssetImage('assets/images/test_prep_images/failed_surrounding.png');

  _TestNoiceAnalyzationState() {
    //TODO: Don't do it with a timer like this, but a timer for getting data from surrounding
    _timer = new Timer(const Duration(seconds: 1), () {
      setState(() {
        if (_isPressed == true) {
          _isPressed = false;
          _analyzingText = _succesText;
          _analyzingImage = _succesImage;
          _showBtn = true;
        } else {
          // TODO: Make it analyze the surrounding
          _isPressed = true;
          _analyzingText = _failedText;
          _analyzingImage = _failedImage;
          _showBtn = true;
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height) / 3,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                _analyzingText,
                style: TextStyle(
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Image(
                    image: _analyzingImage,
                    fit: BoxFit.fill,
                  ),
                  Visibility(
                    child: RaisedButton(
                      onPressed: () {
                        //TODO: This needs to be implemented properly or whatever Siff wants :-)
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    TestPreperationDeviceConnection()));
                      },
                      child: Text(
                        'OK',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blueAccent,
                    ),
                    visible: _showBtn,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
