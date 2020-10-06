import 'package:flutter/material.dart';

class EarTest extends StatefulWidget {
  @override
  _EarTestState createState() => _EarTestState();
}

class _EarTestState extends State<EarTest> {
  String testingEar = "assets/rightEar.png";

  @override
  void leftEarTest() {
    setState(() {
      this.testingEar = "assets/leftEar.png";
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(
          "Testing connection",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30),
        ),
        content: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.asset(testingEar, alignment: Alignment.center),
              ),
              Align(
                child: Text(
                  "Do you hear the sound?",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        //Think there is a better way ^
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) =>
                              _cancelPopUp(context),
                          //should eliminate itself
                        );
                      },
                      child: Image.asset('assets/no.png')),
                  FlatButton(
                    onPressed: () {
                      if (testingEar == "assets/leftEar.png") {
                        Navigator.of(context).pop();
                      }
                      leftEarTest();
                    },
                    child: Image.asset('assets/yes.png'),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Widget _cancelPopUp(BuildContext context) {
    return AlertDialog(
      title: Text("Check your device connection"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your device needs to be properly \n connected in order to conduct the hearing test",
          )
        ],
      ),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
            // navigate back to "connect your device
            // --> current case homescreen.
          },
          child: Text("OK"),
        )
      ],
    );
  }
}
