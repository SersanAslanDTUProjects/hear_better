import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Align(
          alignment: Alignment.center,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text("Hello"),
            FloatingActionButton(onPressed: () {}, child: Icon(Icons.input))
          ])),
    ));
  }
}
