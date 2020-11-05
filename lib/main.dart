import 'package:flutter/material.dart' hide Router;
import 'package:hear_better/theme/app_theme.dart';
import 'package:hear_better/theme/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:hear_better/screens/home.dart';
import 'package:hear_better/screens/test_result/comparing_results.dart';
import 'package:hear_better/screens/test_result/result.dart';
import 'package:hear_better/screens/test_result/LineChart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HearBetter',
      theme: ThemeData(),
      initialRoute: Router.homeScreen,
      onGenerateRoute: Router.onGenerateRoute,
      navigatorKey: Router.navigatorKey,
    );
  }
}
