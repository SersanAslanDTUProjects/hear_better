import 'package:flutter/material.dart' hide Router;
import 'package:flutter/services.dart';
import 'package:hear_better/models/hbuser.dart';
import 'package:hear_better/services/auth.dart';
import 'package:hear_better/theme/routes/router.gr.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return StreamProvider<HBUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'HearBetter',
        theme: ThemeData(),
        initialRoute: Router.wrapper,
        onGenerateRoute: Router.onGenerateRoute,
        navigatorKey: Router.navigatorKey,
      ),
    );
  }
}
