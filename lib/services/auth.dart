import 'package:firebase_auth/firebase_auth.dart';
import 'package:hear_better/models/hbuser.dart';
import 'package:hear_better/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create a user object based on firebase user
  HBUser _userFromFirebaseUser(User user) {
    return user != null ? HBUser(uid: user.uid) : null;
  }

  // Auth change user stream
  Stream<HBUser> get user {
    return _auth
        .authStateChanges()
        .map((User user) => _userFromFirebaseUser(user));
  }

  // Sign in anonymously
  Future signInAnonymously() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User user = userCredential.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in with Email & Password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = userCredential.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      return null;
    }
  }

  // Register with Email & Password
  Future signUpWithEmailAndPassword(String username, String email,
      String password, String profession, String dateOfBirth) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      await DatabaseService(uid: user.uid).updateUserData(
          username: username,
          email: email,
          password: password,
          dateOfBirth: dateOfBirth,
          profession: profession);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
