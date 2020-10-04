import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hear_better/main.dart';
import 'package:hear_better/screens/dialogs/test_connection/ear_test_connection.dart';

class TestConnection extends StatefulWidget {
  @override
  _TestConnectionState createState() => _TestConnectionState();
}

class _TestConnectionState extends State<TestConnection> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text(
          "click me!",
          textAlign: TextAlign.center,
        ),
        onPressed: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => EarTest(),
          );
        },
      ),
    ));
  }
}
