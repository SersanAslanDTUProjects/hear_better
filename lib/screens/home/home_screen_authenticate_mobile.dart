import 'package:flutter/material.dart' hide Router;
import 'package:hear_better/services/auth.dart';
import 'package:hear_better/theme/app_theme.dart';
import 'package:hear_better/theme/routes/router.gr.dart';

class HomeScreenAuthenticateMobile extends StatefulWidget {
  @override
  _HomeScreenAuthenticateMobileState createState() =>
      _HomeScreenAuthenticateMobileState();
}

class _HomeScreenAuthenticateMobileState
    extends State<HomeScreenAuthenticateMobile> {
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
              margin: EdgeInsets.fromLTRB(50, 50, 50, 20),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 30),
                    child: Image.asset(
                      'assets/images/hearbetter_logo.png',
                    ),
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  SizedBox(
                    height: 60,
                    width: _screenWidth,
                    child: RaisedButton(
                      color: AppTheme.colors.primaryGreen,
                      onPressed: () {
                        Router.navigator
                            .pushNamed(Router.hearingTestPreperationScreen);
                      },
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
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: SizedBox(
                          height: 40,
                          width: _screenWidth / 1.5,
                          child: RaisedButton(
                            color: AppTheme.colors.primaryBlue,
                            onPressed: () => Router.navigator
                                .pushNamed(Router.authenticationScreen),
                            child: Text(
                              'Login or Sign Up',
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
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Keep track of your history!",
                        style: TextStyle(
                          fontSize: 20,
                          color: AppTheme.colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
