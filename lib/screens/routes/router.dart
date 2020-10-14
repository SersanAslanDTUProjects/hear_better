import 'package:auto_route/auto_route_annotations.dart';
import 'package:hear_better/screens/authentication/authentication_screen.dart';

@autoRouter
class $Router {
  @initial
  AuthenticationScreen authenticationScreen;
}
