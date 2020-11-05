import 'package:flutter/material.dart';
import 'package:hear_better/screens/ui/responsive_information.dart';
import 'package:hear_better/utils/ui_utils.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
          BuildContext context, ResponsiveInformation responsiveInformation)
      builder;
  const ResponsiveBuilder({Key key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var mediaQuery = MediaQuery.of(context);
        var responsiveInformation = ResponsiveInformation(
          deviceScreenType: getDeviceScreenType(mediaQuery),
          screenSize: mediaQuery.size,
          localWidgetSize: Size(constraints.maxWidth, constraints.maxHeight),
        );
        return builder(context, responsiveInformation);
      },
    );
  }
}
