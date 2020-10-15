import 'package:flutter/material.dart';
import 'package:hear_better/screens/ui/orientation_layout.dart';
import 'package:hear_better/screens/ui/screen_type_layout.dart';

import 'authentication_screen_mobile.dart';
import 'authentication_screen_tablet.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        potrait: AuthenticationScreenMobile(),
      ),
      //TODO: If anyone wants to implement the UI for tablets, then go into that class.
      tablet: OrientationLayout(
        potrait: AuthenticationScreenTablet(),
      ),
    );
  }
}
