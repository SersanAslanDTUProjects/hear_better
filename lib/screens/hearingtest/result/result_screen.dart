import 'package:flutter/material.dart';
import 'package:hear_better/screens/hearingtest/result/result_screen_mobile.dart';
import 'package:hear_better/screens/ui/orientation_layout.dart';
import 'package:hear_better/screens/ui/screen_type_layout.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        potrait: ResultScreenMobile(),
      ),
      //TODO: If anyone wants to implement the UI for tablets, then go into that class.
      tablet: OrientationLayout(
        potrait: null,
      ),
    );
  }
}
