import 'package:flutter/material.dart' hide Router;
import 'package:hear_better/screens/hearingtest/preperation/hearing_test_screen_mobile.dart';
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

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Router.navigator.pop(),
                    icon: Icon(Icons.arrow_back),
                    color: AppTheme.colors.primaryBlue,
                  ),
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
                                onPressed: () => Router.navigator
                                    .pushNamed(Router.hearingTestMobileScreen),
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
    );
  }
}
