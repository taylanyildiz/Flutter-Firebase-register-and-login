import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_fire_base_register/auth/database.dart';
import 'package:flutter_fire_base_register/models/user_model.dart';

class AuthSerives {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Users? _usersFromFirebaseUser(User? user) {
    return user != null ? Users(uid: user.uid) : null;
  }

  Future signMailPassword(String? email, String? password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email!, password: password!);
      User user = result.user!;
      return _usersFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      print('error : ${e.code}');
      return null;
    }
  }

  Future registerMailPasword(String? email, String? password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      User user = result.user!;

      /// create a new document for the user with the uid
      await DataBaseService(uid: user.uid)
          .updateUserData('0', 'new member', 100);
      return _usersFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      print('error : ${e.code}');
      return null;
    }
  }

  Future logOut() async {
    try {
      return await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      print('error : ${e.code}');
    }
  }

  Stream<Users?> get user {
    return _auth.authStateChanges().map(_usersFromFirebaseUser);
  }
}
