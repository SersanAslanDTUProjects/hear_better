import 'package:flutter/material.dart';
import 'package:hear_better/models/audiogram.dart';
import 'package:hear_better/models/hbuser.dart';
import 'package:hear_better/services/database.dart';

class AudiogramList extends StatefulWidget {
  HBUser user;

  AudiogramList({this.user});

  @override
  _AudiogramListState createState() => _AudiogramListState(user);
}

class _AudiogramListState extends State<AudiogramList> {
  HBUser user;
  _AudiogramListState(HBUser user){
    this.user = user;
  }

  @override
  Widget build(BuildContext context) {
    Stream<List<Audiogram>> stream = DatabaseService(uid: user.uid).audiograms;
    List<Audiogram> audiograms = new List();

    stream.forEach((elements) async {
      for (var audiogram in elements) {
        await audiograms.add(audiogram);
        print(audiogram.audioUUID);
        print(audiogram.rightEar);
        print(audiogram.leftEar);
        print("Stream lenght");
        print(stream.length);
        print("-----------------------");
      }
      print("Audiogram lenght");
      print(audiograms.length);
      print(audiograms[3].audioUUID);
    });
    final List<String> entries = <String>['A', 'B', 'C'];

    final List<int> colorCodes = <int>[600, 500, 100];

    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(child: Text(audiograms.length.toString())),
          );
        }
    );
  }
}
