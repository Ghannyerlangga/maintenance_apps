import 'package:firebase_auth/firebase_auth.dart';
import 'package:maintenance_apps/Services/database.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  // User _userFromFirebaseUser(FirebaseUser firebaseUser){
  //   return firebaseUser != null ? User(uid: firebaseUser.uid) : null;
  // }

  // Stream<User> get firebaseUser{
  //   return _auth.onAuthStateChanged
  //     .map(_userFromFirebaseUser);
  // }

  //Sign In Anonym
  static Future<FirebaseUser> signInAnonymous() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser firebaseUser = result.user;

      return firebaseUser;
    } catch (e) {
      print(e.toString());

      return null;
    }
  }

  //sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser firebaseUser = result.user;
      return firebaseUser;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email & password
  Future registerWithEmailAndPassword(
      String email, String password, String nama, String alamat) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser firebaseUser = result.user;

      await DatabaseService(uid: firebaseUser.uid)
          .updateUserData(nama, 'Employee', alamat);
      return firebaseUser;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign Out
  static Future<void> signOut() async {
    _auth.signOut();
  }

  static Stream<FirebaseUser> get firebaseUserStream =>
      _auth.onAuthStateChanged;
}
