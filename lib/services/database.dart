import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hear_better/models/hbuser.dart';

class DatabaseService {
  final String uid;

  // Collection Reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  DatabaseService({this.uid});

  Future updateUserData(String username, String email, String password) async {
    return await userCollection.doc(uid).set({
      'username': username,
      'email': email,
      'password': password,
    });
  }

  HBUser _hbUserFromSnapShot(DocumentSnapshot snapshot) {
    return HBUser(
      uid: uid,
      email: snapshot.data()['email'],
      username: snapshot.data()['username'],
    );
  }

  Stream<HBUser> get user {
    return userCollection.doc(uid).snapshots().map(_hbUserFromSnapShot);
  }
}
