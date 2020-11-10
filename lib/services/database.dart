import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
}
