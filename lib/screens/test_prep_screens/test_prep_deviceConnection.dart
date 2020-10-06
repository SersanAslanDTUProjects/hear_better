import 'package:flutter/material.dart';
import 'package:hear_better/screens/dialogs/ear_test_connection.dart';

class TestPreperationDeviceConnection extends StatefulWidget {
  @override
  _TestPreperationDeviceConnectionState createState() =>
      _TestPreperationDeviceConnectionState();
}

class _TestPreperationDeviceConnectionState
    extends State<TestPreperationDeviceConnection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Connect your device',
                      style: TextStyle(
                        fontSize: 36.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 75, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/test_prep_images/headset.png',
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 75, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/test_prep_images/earplugs.png',
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RawMaterialButton(
                      onPressed: () {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) => EarTest(),
                        );
                      },
                      fillColor: Colors.greenAccent,
                      child: Icon(
                        Icons.check,
                        size: 35.0,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
