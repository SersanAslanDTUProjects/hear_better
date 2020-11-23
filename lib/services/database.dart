import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hear_better/models/audiogram.dart';
import 'package:hear_better/models/hbuser.dart';

class DatabaseService {
  final String uid;

  // Collection Reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  DatabaseService({this.uid});

  Future updateUserData(
      {String username,
      String email,
      String password,
      String profession,
      String dateOfBirth}) async {
    return await userCollection.doc(uid).set({
      'username': username,
      'email': email,
      'password': password,
      'profession': profession,
      'dateOfBirth': dateOfBirth,
    });
  }

  Future addAudiogramData({Audiogram audiogram}) async {
    return await userCollection
        .doc(uid)
        .collection("audiograms")
        .doc(audiogram.audioUUID)
        .set({
      'audioUUID': audiogram.audioUUID,
      'leftEar': audiogram.leftEar,
      'rightEar': audiogram.rightEar
    });
  }

  /* List<Audiogram> getAudiogramsData() {
    List<Audiogram> audiograms = new List();

    userCollection.doc(uid).collection("audiograms").get().then((value) => {
          value.docs.forEach((doc) {
            Audiogram audiogram = new Audiogram();
            audiogram.audioUUID = doc['audioUUID'];
            audiogram.leftEar = doc['leftEar'];
            audiogram.rightEar = doc['rightEar'];
            audiograms.add(audiogram);
            print(audiogram.audioUUID);
            print(audiogram.rightEar);
            print(audiogram.leftEar);
            print("------------------------");
          })
        });
    return audiograms;
  } */

  HBUser _hbUserFromSnapShot(DocumentSnapshot snapshot) {
    return HBUser(
      uid: uid,
      email: snapshot.data()['email'],
      username: snapshot.data()['username'],
      dateOfBirth: snapshot.data()['dateOfBirth'],
      profession: snapshot.data()['profession'],
    );
  }

  Stream<HBUser> get user {
    return userCollection.doc(uid).snapshots().map(_hbUserFromSnapShot);
  }

  List<Audiogram> _audiogramsFromSnapshot(QuerySnapshot snapshot) {
    List<Audiogram> audiograms = new List();
    snapshot.docs.forEach((element) {
      Audiogram audiogram = new Audiogram();
      audiogram.audioUUID = element.data()['audioUUID'];
      audiogram.leftEar = element.data()['leftEar'];
      audiogram.rightEar = element.data()['rightEar'];
      audiograms.add(audiogram);
    });
    return audiograms;
  }

  Stream<List<Audiogram>> get audiograms {
    return userCollection
        .doc(uid)
        .collection("audiograms")
        .snapshots()
        .map(_audiogramsFromSnapshot);
  }
}
