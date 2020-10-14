import 'package:flutter/material.dart';
import 'package:hear_better/screens/ui/base_widget.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key key}) : super(key: key);

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (context, responsiveInformation) {
        return Scaffold(); // TODO: Implement responsive authentication screen UI
      },
    );
  }
}
