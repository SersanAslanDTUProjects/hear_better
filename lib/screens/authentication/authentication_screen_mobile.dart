import 'package:flutter/material.dart';

class AuthenticationScreenMobile extends StatefulWidget {
  @override
  _AuthenticationScreenMobileState createState() =>
      _AuthenticationScreenMobileState();
}

class _AuthenticationScreenMobileState
    extends State<AuthenticationScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
      ),
    );
  }
}
