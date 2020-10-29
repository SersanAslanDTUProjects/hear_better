import 'package:hear_better/models/audiogram.dart';

class TestResult {
  DateTime _timeStamp;
  Audiogram _audiogram;
  double _score;

  TestResult(Audiogram audiogram) {
    this._audiogram = audiogram;
    _timeStamp = new DateTime.now();
    calcScore(audiogram);
  }

  void calcScore(Audiogram audiogram) {
    // TODO impl method to compare audiogram with standard hearing and rate it
    _score = 0;
  }

  double get score => _score;

  Audiogram get audiogram => _audiogram;

  DateTime get timeStamp => _timeStamp;
}
