import 'package:flutter/material.dart';
import 'package:hear_better/screens/hearingtest/preperation/hearing_test_preperation_environment_screen_mobile.dart';
import 'package:hear_better/screens/ui/orientation_layout.dart';
import 'package:hear_better/screens/ui/screen_type_layout.dart';

class HearingTestPreperationScreen extends StatelessWidget {
  const HearingTestPreperationScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        potrait: HearingTestPreperationEnviromentScreenMobile(),
      ),
      //TODO: If anyone wants to implement the UI for tablets, then go into that class.
      tablet: OrientationLayout(
        potrait: null,
      ),
    );
  }
}
