// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'package:currentproject/Services/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:currentproject/Screens/AuthScreens/Modals/user.dart';
import 'package:currentproject/Services/database.dart';

String profilePicture =
    'https://firebasestorage.googleapis.com/v0/b/vqstandards-beta-fb092.appspot.com/o/AppData%2Fprofilephotoexample.jpeg?alt=media&token=23f7af07-8e09-4d5d-8fc0-ca8fd338128f';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create User Object
  Currentuser? _userFromFirebaseUser(User? user) {
    if (user != null) {
      return Currentuser(uid: user.uid);
    } else {
      return null;
    }
  }

//Auth Change User Stream

  Stream<Currentuser?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // Sign in Anonym

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      Utils.showSnackBar(e.toString());
      return null;
    }
  }

  // Sign in via email & password
  Future signInWithEmailandPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      return _userFromFirebaseUser(user);
    } catch (e) {
      Utils.showSnackBar(e.toString());
      return null;
    }
  }

  // Register via email & password

  Future registerWithEmailandPassword(
      String email, String password, String displayName) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      await user?.updateDisplayName(displayName);
      await user?.updatePhotoURL(profilePicture);

      await DatabaseService(uid: user!.uid)
          .updateUserData(displayName, profilePicture);
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Utils.showSnackBar('The password provided is too weak.');

        const Text('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Utils.showSnackBar('The password provided is too weak.');
      }
      return false;
    } catch (e) {
      Utils.showSnackBar(e.toString());
      return false;
    }
  }

  // Sign Out

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      Utils.showSnackBar(e.toString());

      return null;
    }
  }

  createUserWithEmailAndPassword(
      String email, String password, String displayName) {}
}

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    await FirebaseAuth.instance.signInWithCredential(credential);
    notifyListeners();
  }
}
