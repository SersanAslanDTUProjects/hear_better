import 'package:auto_route/auto_route_annotations.dart';
import 'package:hear_better/screens/authentication/authentication_screen.dart';
import 'package:hear_better/screens/authentication/authentication_screen_mobile_login.dart';
import 'package:hear_better/screens/authentication/authentication_screen_mobile_signup.dart';
import 'package:hear_better/screens/hearingtest/preperation/hearing_test_preperation_device_connection_screen_mobile.dart';
import 'package:hear_better/screens/hearingtest/preperation/hearing_test_preperation_screen.dart';
import 'package:hear_better/screens/hearingtest/preperation/hearing_test_preperation_starttest_screen_mobile.dart';
import 'package:hear_better/screens/hearingtest/preperation/hearing_test_preperation_volume_screen_mobile.dart';
import 'package:hear_better/screens/hearingtest/preperation/hearing_test_screen_mobile.dart';
import 'package:hear_better/screens/hearingtest/result/result_screen.dart';
import 'package:hear_better/screens/home/home_screen.dart';
import 'package:hear_better/screens/home/home_screen_mobile.dart';

@autoRouter
class $Router {
  @initial
  HomeScreen homeScreen;
  HomeScreenMobile homeScreenMobile;
  AuthenticationScreen authenticationScreen;
  AuthenticationScreenMobileLogin authenticationScreenMobileLogin;
  AuthenticationScreenMobileSignUp authenticationScreenMobileSignUp;
  HearingTestPreperationScreen hearingTestPreperationScreen;
  HearingTestPreperationDeviceConnectionScreenMobile
      hearingTestPreperationDeviceConnectionScreenMobile;
  HearingTestPreperationVolumeScreenMobile
      hearingTestPreperationVolumeScreenMobile;
  HearingTestPreperationStartTestScreenMobile
      hearingTestPreperationStartTestScreenMobile;
  HearingTestMobileScreen hearingTestMobileScreen;
  ResultScreen resultScreen;
}
