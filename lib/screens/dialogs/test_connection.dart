import 'package:flutter/material.dart';

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
        child: Text("click me!"),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => _earTestPopUp(context),
          );
        },
        backgroundColor: Colors.grey,
      ),
    ));
  }

  Widget _earTestPopUp(BuildContext context) {
    return new AlertDialog(
      title: Text("About pop up"),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/rightEar.png'),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Image.asset('assets/no.png')),
        new FlatButton(
          onPressed: () {

          },
          child: Image.asset('assets/yes.png'),
        ),
      ],
    );
  }
}
