import 'package:flutter/material.dart';

import 'audiogramTile.dart';

class AudiogramList extends StatelessWidget {
  final List audiograms;

  AudiogramList({Key key, this.audiograms}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return AudiogramTile(audiogram: audiograms[index]);
      },
    );
  }
}
