import 'package:flutter/material.dart';



class EarTest extends StatefulWidget {
  @override
  _EarTestState createState() => _EarTestState();
}

class _EarTestState extends State<EarTest> {
  String testingEar ="assets/rightEar.png";


  @override
  void leftEarTest(){
    setState(() {
      testingEar = "assets/leftEar.png";
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
            Image.asset(
              testingEar,
              alignment: Alignment.center,
            ),
            Center(
              child: Align(
                child: Text(
                  "Do you hear the sound?",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlatButton(
                      onPressed: () {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) =>
                              _cancelPopUp(context),
                          //should eliminate itself
                        );
                        // Navigator.of(context).pop();
                      },
                      child: Image.asset('assets/no.png')),
                  FlatButton(
                    onPressed: () {
                      leftEarTest();
                    },
                    child: Image.asset('assets/yes.png'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
            "Your device needs to be properly \n connected in order to conduct the hearing test",
          )
        ],
      ),
      actions: [
        new FlatButton(
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
