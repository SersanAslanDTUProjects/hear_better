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
        child: Text("click me!",
          textAlign: TextAlign.center,),
        onPressed: () {
          showDialog(
            barrierDismissible: false,
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
      title: Text("Testing connection"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/rightEar.png'),
          Text("Do you hear the sound?"),
        ],

      ),
      actions: [
         FlatButton(
            onPressed: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) => _cancelPopUp(context),
                //should navigate to _cancelPopUp
              );
              // Navigator.of(context).pop();
            },
            child: Image.asset('assets/no.png')),
         FlatButton(
          onPressed: () {},
          child: Image.asset('assets/yes.png'),
        ),
      ],
    );

  }

  Widget _cancelPopUp(BuildContext context) {
    return AlertDialog(
      title: Text("Check your device connection"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your devied needs to be properly \n connected in order to conduct the hearing test",
          )
        ],
      ),
      actions: [
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.grey,
          child: Text("OK"),
        )
      ],
    );
  }
}
