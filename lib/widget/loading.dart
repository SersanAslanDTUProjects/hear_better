import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hear_better/theme/app_theme.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.fitWidth,
          alignment: Alignment.bottomCenter,
        ),
      ),
      margin: EdgeInsets.all(0),
      child: Container(
        child: Center(
          child: SpinKitFadingCircle(
            color: AppTheme.colors.primaryBlue,
            size: 50,
          ),
        ),
      ),
    );
  }
}
