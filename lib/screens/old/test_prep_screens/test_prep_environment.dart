import 'package:flutter/material.dart';
import 'package:hear_better/screens/dialogs/test_noise.dart';

class TestPreperationEnvironment extends StatefulWidget {
  @override
  _TestPreperationEnvironmentState createState() =>
      _TestPreperationEnvironmentState();
}

class _TestPreperationEnvironmentState extends State<TestPreperationEnvironment>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

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
                      'Be in a quiet \n enviroment',
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
                      'assets/images/test_prep_images/quiet_icon.png',
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
                        _popUp_Surrounding_Analyzation(context);
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

  void _popUp_Surrounding_Analyzation(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return TestNoiceAnalyzation();
        });
  }
}
