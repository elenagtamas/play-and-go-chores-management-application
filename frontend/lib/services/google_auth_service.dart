import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() async {
    try {
      return await _googleSignIn.signIn();
    } catch (e) {
      if (kDebugMode) {
        print('Login error: $e');
      }
      return null;
    }
  }

  static Future<bool> logout() async {
    try {
      await _googleSignIn.signOut();
      return true;
    } catch (e) {
      if (kDebugMode) {
        print('Logout error: $e');
      }
      return false;
    }
  }
}