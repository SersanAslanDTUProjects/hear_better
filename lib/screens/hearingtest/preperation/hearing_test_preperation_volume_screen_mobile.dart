import 'package:flutter/material.dart' hide Router;

import 'package:hear_better/screens/hearingtest/preperation/hearing_test_preperation_starttest_screen_mobile.dart';
import 'package:hear_better/theme/app_theme.dart';
import 'package:hear_better/theme/routes/router.gr.dart';

class HearingTestPreperationVolumeScreenMobile extends StatefulWidget {
  @override
  _HearingTestPreperationVolumeScreenMobileState createState() =>
      _HearingTestPreperationVolumeScreenMobileState();
}

class _HearingTestPreperationVolumeScreenMobileState
    extends State<HearingTestPreperationVolumeScreenMobile> {
  @override
  Widget build(BuildContext context) {
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
                              'Put volume on \n Max',
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
                              'assets/images/test_prep_images/volume.png',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 100),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RawMaterialButton(
                              onPressed: () => Router.navigator.pushNamed(Router
                                  .hearingTestPreperationStartTestScreenMobile),
                              fillColor: AppTheme.colors.primaryGreen,
                              child: Icon(
                                Icons.check,
                                size: 35.0,
                                color: AppTheme.colors.white,
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
            ],
          ),
        ),
      ),
    );
  }
}
