import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class GoogleSignInService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      log('Google Sign-In error: $e');
      return null;
    }
  }

  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }
}

class FacebookLoginService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<Map<String, dynamic>?> login() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login(
        permissions: ['email', 'public_profile'],
        loginBehavior: LoginBehavior.nativeWithFallback,
        loginTracking: LoginTracking.limited,
      );

      if (result.status == LoginStatus.success) {
        final userData = await FacebookAuth.instance.getUserData();

        final accessToken = result.accessToken;
        final OAuthCredential credential = FacebookAuthProvider.credential(
          accessToken!.tokenString,
        );
        _auth.signInWithCredential(credential);
        return userData;
      } else {
        log('Facebook login failed: ${result.status}');
        log('Message: ${result.message}');
        return null;
      }
    } catch (e) {
      log('Facebook login exception: $e');
      return null;
    }
  }

  Future<void> logout() async {
    await FacebookAuth.instance.logOut();
    await _auth.signOut();
  }

  Future<Map<String, dynamic>?> getCurrentUser() async {
    final accessToken = await FacebookAuth.instance.accessToken;
    if (accessToken != null) {
      return await FacebookAuth.instance.getUserData();
    }
    return null;
  }
}
