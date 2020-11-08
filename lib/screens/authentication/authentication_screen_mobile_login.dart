import 'dart:async';

import 'package:flutter/material.dart' hide Router;
import 'package:hear_better/services/auth.dart';
import 'package:hear_better/theme/app_theme.dart';
import 'package:hear_better/theme/routes/router.gr.dart';
import 'dart:developer';

class AuthenticationScreenMobileLogin extends StatefulWidget {
  @override
  _AuthenticationScreenMobileLoginState createState() =>
      _AuthenticationScreenMobileLoginState();
}

class _AuthenticationScreenMobileLoginState
    extends State<AuthenticationScreenMobileLogin> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String error = '';
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
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
          resizeToAvoidBottomInset: false,
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
                        'Sign In',
                        style: TextStyle(fontSize: 36),
                      ),
                    ),
                    SizedBox(
                      height: 75,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: TextFormField(
                              validator: (val) {
                                Pattern pattern = r'@';
                                RegExp regex = RegExp(pattern);
                                if (val.isEmpty)
                                  return "Email address can't be empty";
                                else if (!regex.hasMatch(val))
                                  return "Invalid email address";
                                else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                icon: Icon(Icons.mail),
                                hintText: 'Email',
                                border: UnderlineInputBorder(),
                              ),
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: TextFormField(
                              validator: (val) => val.length < 6
                                  ? "Enter a password 6+ characters long"
                                  : null,
                              obscureText: true,
                              decoration: InputDecoration(
                                icon: Icon(Icons.lock),
                                hintText: 'Password',
                                border: UnderlineInputBorder(),
                              ),
                              onChanged: (val) {
                                setState(() => password = val);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 40,
                      width: _screenWidth,
                      child: RaisedButton(
                        color: AppTheme.colors.primaryGreen,
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);
                            Timer(Duration(seconds: 2), () {
                              Router.navigator.pushNamed(Router.wrapper);
                            });
                            if (result == null) {
                              setState(() => error = "User doesn't exist");
                            }
                          }
                        },
                        child: Text(
                          'Login',
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
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 40,
                      width: _screenWidth,
                      child: RaisedButton(
                        color: AppTheme.colors.primaryBlue,
                        onPressed: () => Router.navigator
                            .pushNamed(Router.authenticationScreenMobileSignUp),
                        child: Text(
                          'Sign Up',
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
                    SizedBox(height: 20),
                    Text(
                      error,
                      style: TextStyle(
                          color: AppTheme.colors.primaryRed, fontSize: 14),
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
