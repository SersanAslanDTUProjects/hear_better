import 'package:flutter/material.dart';
import 'package:hear_better/screens/ui/device_screen_type.dart';
import 'package:hear_better/screens/ui/responsive_builder.dart';

class ScreenTypeLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  const ScreenTypeLayout({Key key, this.desktop, this.mobile, this.tablet})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, responsiveInformation) {
        if (responsiveInformation.deviceScreenType == DeviceScreenType.Tablet) {
          if (tablet != null) {
            return tablet;
          }
        }
        if (responsiveInformation.deviceScreenType ==
            DeviceScreenType.Desktop) {
          if (desktop != null) {
            return desktop;
          }
        }

        return mobile;
      },
    );
  }
}
