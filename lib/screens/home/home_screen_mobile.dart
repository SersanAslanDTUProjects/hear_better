import 'package:flutter/material.dart' hide Router;
import 'package:hear_better/models/audiogram.dart';
import 'package:hear_better/models/hbuser.dart';
import 'package:hear_better/services/auth.dart';
import 'package:hear_better/services/database.dart';
import 'package:hear_better/theme/app_theme.dart';
import 'package:hear_better/theme/routes/router.gr.dart';
import 'package:hear_better/widget/audiogramList.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:hear_better/utils/ui_utils.dart';

class HomeScreenMobile extends StatefulWidget {
  @override
  _HomeScreenMobileState createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  final AuthService _auth = AuthService();

  Future<bool> onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    final user = Provider.of<HBUser>(context);

    return WillPopScope(
      onWillPop: onWillPop,
      child: Container(
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
                              AudiogramList(user: user),
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
      ),
    );
  }
}
