import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:hear_better/models/audiogram.dart';
import 'file:///C:/Users/magnu/Documents/GitHub/hear_better/lib/widget/audiogram/LineChart.dart';
import 'package:hear_better/screens/hearingtest/result/result_screen.dart';
import 'package:hear_better/screens/hearingtest/result/result_screen.dart';
import 'package:hear_better/screens/hearingtest/result/result_screen.dart';
import 'package:hear_better/theme/routes/router.gr.dart';

class AudiogramTile extends StatelessWidget {
  final Audiogram audiogram;

  const AudiogramTile({Key key, this.audiogram}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 6),
        child: ListTile(
          title: Text(audiogram.audioUUID),
          //TODO: Implement show audiogram in a different screen
          onTap: () => Router.navigator.pushNamed(
              Router.resultScreen),
        ),
      ),
    );
  }
}
