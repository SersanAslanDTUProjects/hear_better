import 'package:flutter/material.dart';

class TestPreperationVolume extends StatefulWidget {
  @override
  _TestPreperationVolumeState createState() => _TestPreperationVolumeState();
}

class _TestPreperationVolumeState extends State<TestPreperationVolume> {
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
                      'Put volume on Max',
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
                      'assets/images/test_prep_images/volume.png',
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RawMaterialButton(
                      onPressed: () {
                        // TODO: Check if the volume is max before getting to the next step
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
