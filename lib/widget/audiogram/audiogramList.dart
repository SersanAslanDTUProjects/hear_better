import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:hear_better/models/audiogram.dart';
import 'package:hear_better/theme/app_theme.dart';
import 'package:hear_better/theme/routes/router.gr.dart';

import 'audiogramTile.dart';

class AudiogramList extends StatelessWidget {
  final AsyncSnapshot snapshot;

  AudiogramList({Key key, this.snapshot}) : super(key: key);

  /* int getNumber(List<Audiogram> audiograms) {
    var value = 5;
    audiograms.removeAt(0);
    return value;
  } */

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    ScrollController controller = new ScrollController();

    List<Audiogram> audiograms = snapshot.data;
    if (audiograms.isEmpty) {
      return Center(
        child: Column(
          children: [
            Text(
              "You haven't taken any tests yet",
              style: TextStyle(color: AppTheme.colors.white, fontSize: 20),
            ),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: SizedBox(
                height: 30,
                width: _screenWidth,
                child: RaisedButton(
                  color: AppTheme.colors.primaryGreen,
                  onPressed: () => Router.navigator
                      .pushNamed(Router.hearingTestPreperationScreen),
                  child: AutoSizeText(
                    'Take your first test here',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppTheme.colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        child: ListView.builder(
          controller: controller,
          reverse: true,
          itemCount: audiograms.length <= 5
              ? audiograms.length
              : 5 /* getNumber(audiograms) */,
          itemBuilder: (context, index) {
            return AudiogramTile(audiogram: audiograms[index]);
          },
        ),
      );
    }
  }
}
