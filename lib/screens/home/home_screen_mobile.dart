import 'package:flutter/material.dart' hide Router;
import 'package:hear_better/services/auth.dart';
import 'package:hear_better/theme/app_theme.dart';
import 'package:hear_better/theme/routes/router.gr.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomeScreenMobile extends StatefulWidget {
  @override
  _HomeScreenMobileState createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.fitWidth,
          alignment: Alignment.bottomCenter,
        ),
      ),
      margin: EdgeInsets.all(0),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: SizedBox(
                      height: 75,
                      child: Row(
                        children: <Widget>[
                          Image.asset("assets/images/hearbetter_logo.png"),
                          Spacer(),
                          RawMaterialButton(
                            onPressed: () => Router.navigator
                                .pushNamed(Router.profileScreen),
                            elevation: 2.0,
                            fillColor: Colors.red,
                            child: Icon(
                              Icons.person,
                              size: 35.0,
                            ),
                            padding: EdgeInsets.all(15.0),
                            shape: CircleBorder(),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 75,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0, left: 50, right: 50),
                    child: SizedBox(
                      height: 60,
                      width: _screenWidth,
                      child: RaisedButton(
                        color: AppTheme.colors.primaryGreen,
                        onPressed: () => Router.navigator
                            .pushNamed(Router.hearingTestPreperationScreen),
                        child: Text(
                          'Test your hearing',
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
                  ),
                  SizedBox(height: 150),
                  SizedBox(
                    height: 350,
                    width: _screenWidth,
                    child: Container(
                      color: AppTheme.colors.primaryBlue.withOpacity(0.8),
                      margin: EdgeInsets.only(left: 30, right: 30),
                      child: Container(
                        margin: EdgeInsets.all(30),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "My Hearing",
                              style: TextStyle(
                                color: AppTheme.colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 80),
                  SizedBox(
                    width: _screenWidth,
                    child: Container(
                      color: AppTheme.colors.primaryBlue.withOpacity(0.8),
                      margin: EdgeInsets.only(left: 30, right: 30),
                      child: Container(
                        margin: EdgeInsets.all(30),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Noise Recordings",
                              style: TextStyle(
                                color: AppTheme.colors.white,
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              child: SfCalendar(
                                view: CalendarView.month,
                                firstDayOfWeek: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
