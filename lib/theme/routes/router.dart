import 'package:auto_route/auto_route_annotations.dart';
import 'package:hear_better/screens/authentication/authentication_screen.dart';
import 'package:hear_better/screens/authentication/authentication_screen_mobile_login.dart';
import 'package:hear_better/screens/authentication/authentication_screen_mobile_signup.dart';
import 'package:hear_better/screens/hearingtest/preperation/hearing_test_preperation_device_connection_screen_mobile.dart';
import 'package:hear_better/screens/hearingtest/preperation/hearing_test_preperation_screen.dart';
import 'package:hear_better/screens/hearingtest/preperation/hearing_test_preperation_starttest_screen_mobile.dart';
import 'package:hear_better/screens/hearingtest/preperation/hearing_test_preperation_volume_screen_mobile.dart';
import 'package:hear_better/screens/hearingtest/preperation/hearing_test_screen_mobile.dart';
import 'file:///C:/Users/magnu/Documents/GitHub/hear_better/lib/screens/hearingtest/result/history/Historic_result_mobile.dart';
import 'package:hear_better/screens/hearingtest/result/result_screen.dart';
import 'package:hear_better/screens/home/home_screen.dart';
import 'package:hear_better/screens/home/home_screen_authenticate_mobile.dart';
import 'package:hear_better/screens/home/home_screen_mobile.dart';
import 'package:hear_better/screens/profile/profile_screen.dart';
import 'package:hear_better/screens/profile/profile_screen_mobile.dart';
import 'package:hear_better/screens/wrapper.dart';

@autoRouter
class $Router {
  // flutter pub run build_runner watch --delete-conflicting-outputs
  @initial
  Wrapper wrapper;
  HomeScreen homeScreen;
  HomeScreenMobile homeScreenMobile;
  HomeScreenAuthenticateMobile homeScreenAuthenticateMobile;
  AuthenticationScreen authenticationScreen;
  AuthenticationScreenMobileLogin authenticationScreenMobileLogin;
  AuthenticationScreenMobileSignUp authenticationScreenMobileSignUp;
  ProfileScreen profileScreen;
  ProfileScreenMobile profileScreenMobile;
  HearingTestPreperationScreen hearingTestPreperationScreen;
  HearingTestPreperationDeviceConnectionScreenMobile
      hearingTestPreperationDeviceConnectionScreenMobile;
  HearingTestPreperationVolumeScreenMobile
      hearingTestPreperationVolumeScreenMobile;
  HearingTestPreperationStartTestScreenMobile
      hearingTestPreperationStartTestScreenMobile;
  HearingTestMobileScreen hearingTestMobileScreen;
  ResultScreen resultScreen;
  HistoricResult historicResultScreen;
}
