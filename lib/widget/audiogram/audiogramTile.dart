import 'package:flutter/material.dart';
import 'package:hear_better/models/audiogram.dart';

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
          onTap: () => null,
        ),
      ),
    );
  }
}
