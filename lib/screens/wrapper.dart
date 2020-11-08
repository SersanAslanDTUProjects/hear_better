import 'package:flutter/material.dart';
import 'package:hear_better/models/hbuser.dart';
import 'package:provider/provider.dart';

import 'home/home_screen_authenticate_mobile.dart';
import 'home/home_screen_mobile.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<HBUser>(context);

    if (user == null)
      return HomeScreenAuthenticateMobile();
    else
      return HomeScreenMobile();
  }
}
