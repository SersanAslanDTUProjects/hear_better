import 'package:flutter/material.dart' hide Router;
import 'package:hear_better/screens/dialogs/ear_test_connection.dart';
import 'package:hear_better/theme/app_theme.dart';
import 'package:hear_better/theme/routes/router.gr.dart';

class HearingTestPreperationDeviceConnectionScreenMobile
    extends StatefulWidget {
  @override
  _HearingTestPreperationDeviceConnectionScreenMobileState createState() =>
      _HearingTestPreperationDeviceConnectionScreenMobileState();
}

class _HearingTestPreperationDeviceConnectionScreenMobileState
    extends State<HearingTestPreperationDeviceConnectionScreenMobile> {
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
                              'Connect your  \n device',
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
                              'assets/images/test_prep_images/headset.png',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 45),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/test_prep_images/earplugs.png',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                      Container(
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
