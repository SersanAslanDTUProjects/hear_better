import 'package:flutter/material.dart';

class CancelDialog extends StatelessWidget {
  CancelDialog(BuildContext context);

  @override
  Widget build(BuildContext context) {
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
