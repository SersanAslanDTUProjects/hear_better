import 'package:flutter/material.dart' hide Router;
import 'package:hear_better/screens/dialogs/test_noise.dart';
import 'package:hear_better/theme/app_theme.dart';
import 'package:hear_better/theme/routes/router.gr.dart';

class HearingTestPreperationEnviromentScreenMobile extends StatefulWidget {
  @override
  _HearingTestPreperationEnviromentScreenMobileState createState() =>
      _HearingTestPreperationEnviromentScreenMobileState();
}

class _HearingTestPreperationEnviromentScreenMobileState
    extends State<HearingTestPreperationEnviromentScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                              'Be in a quiet \n enviroment',
                              style: TextStyle(
                                fontSize: 36.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/test_prep_images/quiet_icon.png',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 150),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RawMaterialButton(
                              onPressed: () {
                                _popUp_Surrounding_Analyzation(context);
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

  void _popUp_Surrounding_Analyzation(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return TestNoiceAnalyzation();
        });
  }
}
