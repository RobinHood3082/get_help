import 'package:get_help/core/utils/notifier_state.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider extends ChangeNotifier {
  NotifierState _notifierState = NotifierState.initial;
  NotifierState get notifierState => _notifierState;

  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  final googleSignIn = GoogleSignIn();

  Future<void> googleLogin() async {
    try {
      _setState(NotifierState.loading);

      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return;
      }
      _user = googleUser;
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> logout() async {
    _setState(NotifierState.loading);
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
    _setState(NotifierState.loaded);
  }

  void _setState(NotifierState notifierState) {
    _notifierState = notifierState;
    notifyListeners();
  }
}
