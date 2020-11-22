import 'package:flutter/material.dart' hide Router;
import 'package:hear_better/theme/app_theme.dart';
import 'package:hear_better/theme/routes/router.gr.dart';

class HearingTestPreperationStartTestScreenMobile extends StatefulWidget {
  @override
  _HearingTestPreperationStartTestScreenMobileState createState() =>
      _HearingTestPreperationStartTestScreenMobileState();
}

class _HearingTestPreperationStartTestScreenMobileState
    extends State<HearingTestPreperationStartTestScreenMobile> {
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
                Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(50, 40, 50, 50),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Tap the screen \n when you \n hear a sound',
                                style: TextStyle(
                                  fontSize: 36.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 75),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/test_prep_images/tap.png',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 100),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 40,
                                width: _screenWidth / 2,
                                child: RaisedButton(
                                  color: AppTheme.colors.primaryGreen,
                                  onPressed: () => Router.navigator.pushNamed(
                                      Router.hearingTestMobileScreen),
                                  child: Text(
                                    'Start',
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
