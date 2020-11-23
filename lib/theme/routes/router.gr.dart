// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/router_utils.dart';
import 'package:hear_better/screens/wrapper.dart';
import 'package:hear_better/screens/home/home_screen.dart';
import 'package:hear_better/screens/home/home_screen_mobile.dart';
import 'package:hear_better/screens/home/home_screen_authenticate_mobile.dart';
import 'package:hear_better/screens/authentication/authentication_screen.dart';
import 'package:hear_better/screens/authentication/authentication_screen_mobile_login.dart';
import 'package:hear_better/screens/authentication/authentication_screen_mobile_signup.dart';
import 'package:hear_better/screens/profile/profile_screen.dart';
import 'package:hear_better/screens/profile/profile_screen_mobile.dart';
import 'package:hear_better/screens/hearingtest/preperation/hearing_test_preperation_screen.dart';
import 'package:hear_better/screens/hearingtest/preperation/hearing_test_preperation_device_connection_screen_mobile.dart';
import 'package:hear_better/screens/hearingtest/preperation/hearing_test_preperation_volume_screen_mobile.dart';
import 'package:hear_better/screens/hearingtest/preperation/hearing_test_preperation_starttest_screen_mobile.dart';
import 'package:hear_better/screens/hearingtest/preperation/hearing_test_screen_mobile.dart';
import 'package:hear_better/screens/hearingtest/result/result_screen.dart';
import 'package:hear_better/screens/hearingtest/result/history/Historic_result_mobile.dart';
import 'package:hear_better/models/audiogram.dart';

class Router {
  static const wrapper = '/';
  static const homeScreen = '/home-screen';
  static const homeScreenMobile = '/home-screen-mobile';
  static const homeScreenAuthenticateMobile =
      '/home-screen-authenticate-mobile';
  static const authenticationScreen = '/authentication-screen';
  static const authenticationScreenMobileLogin =
      '/authentication-screen-mobile-login';
  static const authenticationScreenMobileSignUp =
      '/authentication-screen-mobile-sign-up';
  static const profileScreen = '/profile-screen';
  static const profileScreenMobile = '/profile-screen-mobile';
  static const hearingTestPreperationScreen =
      '/hearing-test-preperation-screen';
  static const hearingTestPreperationDeviceConnectionScreenMobile =
      '/hearing-test-preperation-device-connection-screen-mobile';
  static const hearingTestPreperationVolumeScreenMobile =
      '/hearing-test-preperation-volume-screen-mobile';
  static const hearingTestPreperationStartTestScreenMobile =
      '/hearing-test-preperation-start-test-screen-mobile';
  static const hearingTestMobileScreen = '/hearing-test-mobile-screen';
  static const resultScreen = '/result-screen';
  static const historicResultScreen = '/historic-result-screen';
  static GlobalKey<NavigatorState> get navigatorKey =>
      getNavigatorKey<Router>();
  static NavigatorState get navigator => navigatorKey.currentState;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Router.wrapper:
        return MaterialPageRoute(
          builder: (_) => Wrapper(),
          settings: settings,
        );
      case Router.homeScreen:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => HomeScreen(key: typedArgs),
          settings: settings,
        );
      case Router.homeScreenMobile:
        return MaterialPageRoute(
          builder: (_) => HomeScreenMobile(),
          settings: settings,
        );
      case Router.homeScreenAuthenticateMobile:
        return MaterialPageRoute(
          builder: (_) => HomeScreenAuthenticateMobile(),
          settings: settings,
        );
      case Router.authenticationScreen:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => AuthenticationScreen(key: typedArgs),
          settings: settings,
        );
      case Router.authenticationScreenMobileLogin:
        return MaterialPageRoute(
          builder: (_) => AuthenticationScreenMobileLogin(),
          settings: settings,
        );
      case Router.authenticationScreenMobileSignUp:
        return MaterialPageRoute(
          builder: (_) => AuthenticationScreenMobileSignUp(),
          settings: settings,
        );
      case Router.profileScreen:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => ProfileScreen(key: typedArgs),
          settings: settings,
        );
      case Router.profileScreenMobile:
        return MaterialPageRoute(
          builder: (_) => ProfileScreenMobile(),
          settings: settings,
        );
      case Router.hearingTestPreperationScreen:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => HearingTestPreperationScreen(key: typedArgs),
          settings: settings,
        );
      case Router.hearingTestPreperationDeviceConnectionScreenMobile:
        return MaterialPageRoute(
          builder: (_) => HearingTestPreperationDeviceConnectionScreenMobile(),
          settings: settings,
        );
      case Router.hearingTestPreperationVolumeScreenMobile:
        return MaterialPageRoute(
          builder: (_) => HearingTestPreperationVolumeScreenMobile(),
          settings: settings,
        );
      case Router.hearingTestPreperationStartTestScreenMobile:
        return MaterialPageRoute(
          builder: (_) => HearingTestPreperationStartTestScreenMobile(),
          settings: settings,
        );
      case Router.hearingTestMobileScreen:
        return MaterialPageRoute(
          builder: (_) => HearingTestMobileScreen(),
          settings: settings,
        );
      case Router.resultScreen:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => ResultScreen(key: typedArgs),
          settings: settings,
        );
      case Router.historicResultScreen:
        if (hasInvalidArgs<Audiogram>(args, isRequired: true)) {
          return misTypedArgsRoute<Audiogram>(args);
        }
        final typedArgs = args as Audiogram;
        return MaterialPageRoute(
          builder: (_) => HistoricResult(audiogram: typedArgs),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
