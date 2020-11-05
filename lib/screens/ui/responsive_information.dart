import 'package:flutter/material.dart';
import 'device_screen_type.dart';

class ResponsiveInformation {
  final Orientation orientation;
  final DeviceScreenType deviceScreenType;
  final Size screenSize;
  final Size localWidgetSize;

  ResponsiveInformation(
      {this.orientation,
      this.deviceScreenType,
      this.screenSize,
      this.localWidgetSize});

  @override
  String toString() {
    return 'Orientation: $orientation DeviceType: $deviceScreenType ScreenSize: $screenSize LocalWidgetSize: $localWidgetSize';
  }
}
