import 'package:flutter/material.dart' hide Router;
import 'package:hear_better/theme/app_theme.dart';
import 'package:hear_better/theme/routes/router.gr.dart';

class AuthenticationScreenMobileSignUp extends StatefulWidget {
  @override
  _AuthenticationScreenMobileSignUpState createState() =>
      _AuthenticationScreenMobileSignUpState();
}

class _AuthenticationScreenMobileSignUpState
    extends State<AuthenticationScreenMobileSignUp> {
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
              margin: EdgeInsets.all(50),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 30),
                    child: Image.asset(
                      'assets/images/hearbetter_logo.png',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 36),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Container(
                    child: TextField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: "Username",
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.mail),
                        hintText: 'Email',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock),
                        hintText: 'Password',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 75,
                  ),
                  SizedBox(
                    height: 40,
                    width: _screenWidth,
                    child: RaisedButton(
                      color: AppTheme.colors.primaryBlue,
                      onPressed: () {},
                      child: Text(
                        'Confirm',
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
          ),
        ),
      ),
    );
  }
}
