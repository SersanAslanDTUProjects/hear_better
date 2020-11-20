import 'package:flutter/material.dart';
import 'package:hear_better/models/audiogram.dart';
import 'package:hear_better/models/hbuser.dart';
import 'package:hear_better/services/database.dart';

class AudiogramList extends StatefulWidget {
  HBUser user;

  AudiogramList({this.user});

  @override
  _AudiogramListState createState() => _AudiogramListState();
}

class _AudiogramListState extends State<AudiogramList> {
  @override
  Widget build(BuildContext context) {
    /* Stream<List<Audiogram>> stream = DatabaseService(uid: user.uid).audiograms;

    stream.forEach((audiograms) {
      for (var audiogram in audiograms) {
        print(audiogram.audioUUID);
        print(audiogram.rightEar);
        print(audiogram.leftEar);
        print("-----------------------");
      }
    }); */
    return Container();
  }
}
