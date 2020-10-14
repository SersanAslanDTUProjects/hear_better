import 'package:flutter/material.dart';
import 'package:hear_better/screens/ui/responsive_information.dart';
import 'package:hear_better/utils/ui_utils.dart';

class BaseWidget extends StatelessWidget {
  final Widget Function(
          BuildContext context, ResponsiveInformation responsiveInformation)
      builder;
  const BaseWidget({Key key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        var responsiveInformation = ResponsiveInformation(
          orientation: mediaQuery.orientation,
          deviceScreenType: getDeviceScreenType(mediaQuery),
          screenSize: mediaQuery.size,
          localWidgetSize: Size(constraints.maxWidth, constraints.maxHeight),
        );
        return builder(context, responsiveInformation);
      },
    );
  }
}
