import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TestHearing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(30.0),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.close, size: 30),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: Text("Progress"),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                alignment: Alignment.center,
                child: SizedBox.expand(
                  child: FlatButton(
                    onLongPress: () {
                      HapticFeedback.mediumImpact();
                      // TODO add secondary feed back if vibration not enabled or inform user enable vibration when boarding the app
                    },
                    child: Icon(Icons.hearing, size: 150.0,), // TODO animation or better icon
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}
