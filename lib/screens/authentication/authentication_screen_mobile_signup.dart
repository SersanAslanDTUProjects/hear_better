import 'dart:async';

import 'package:flutter/material.dart' hide Router;
import 'package:hear_better/services/auth.dart';
import 'package:hear_better/theme/app_theme.dart';
import 'package:hear_better/theme/routes/router.gr.dart';
import 'package:hear_better/widget/loading.dart';
import 'package:intl/intl.dart';

class AuthenticationScreenMobileSignUp extends StatefulWidget {
  @override
  _AuthenticationScreenMobileSignUpState createState() =>
      _AuthenticationScreenMobileSignUpState();
}

class _AuthenticationScreenMobileSignUpState
    extends State<AuthenticationScreenMobileSignUp> {
  AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _email = '';
  String _password = '';
  String _dateOfBirth = '';
  String _profession = 'Not Set';
  String _error = '';
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('dd-MM-yyyy');
    _dateOfBirth = formatter.format(now);

    return _loading
        ? Loading()
        : GestureDetector(
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
                      margin: EdgeInsets.only(top: 50, left: 50, right: 50),
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
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Container(
                                  child: TextFormField(
                                    validator: (val) => val.isEmpty
                                        ? "Enter an username"
                                        : null,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.person),
                                      hintText: "Username",
                                      border: UnderlineInputBorder(),
                                    ),
                                    onChanged: (val) {
                                      setState(() => _username = val);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
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
                                      setState(() => _email = val);
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
                                      setState(() => _password = val);
                                    },
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 40),
                                  child: SizedBox(
                                    height: 40,
                                    width: _screenWidth,
                                    child: RaisedButton(
                                      color: AppTheme.colors.primaryBlue,
                                      onPressed: () async {
                                        if (_formKey.currentState.validate()) {
                                          setState(() => _loading = true);
                                          dynamic result = await _auth
                                              .signUpWithEmailAndPassword(
                                                  _username,
                                                  _email,
                                                  _password,
                                                  _profession,
                                                  _dateOfBirth);
                                          if (result == null) {
                                            setState(() {
                                              _error = 'Failed to create user';
                                              _loading = false;
                                            });
                                          } else {
                                            Router.navigator
                                                .pushNamed(Router.wrapper);
                                          }
                                        }
                                      },
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
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: SizedBox(
                                    height: 40,
                                    width: _screenWidth / 3,
                                    child: FlatButton(
                                      onPressed: () {
                                        Router.navigator.pop();
                                      },
                                      child: Text(
                                        'Back',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: AppTheme.colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  _error,
                                  style: TextStyle(
                                      color: AppTheme.colors.primaryRed,
                                      fontSize: 14),
                                ),
                              ],
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
