import 'package:flutter/material.dart';
import 'package:hear_better/screens/ui/device_screen_type.dart';

DeviceScreenType getDeviceScreenType(MediaQueryData mediaQuery) {
  double deviceWidth = mediaQuery.size.shortestSide;

  if (deviceWidth > 950) {
    return DeviceScreenType.Desktop;
  }
  if (deviceWidth > 600) {
    return DeviceScreenType.Tablet;
  }

  return DeviceScreenType.Mobile;
}
