import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
  );

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

  static Future<Map<String, dynamic>?> loginWithToken() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        print('Google user is null');
        return null;
      }

      print('Google user: ${googleUser.email}');
      
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      
      print('Access Token: ${googleAuth.accessToken != null ? "Received" : "No"}');
      print('ID Token: ${googleAuth.idToken != null ? "Received" : "No"}');
      
      if (googleAuth.idToken == null) {
        print('ID Token is null');
        return null;
      }
      
      return {
        'user': googleUser,
        'idToken': googleAuth.idToken,
        'accessToken': googleAuth.accessToken,
      };
    } catch (e) {
      print('Login error: $e');
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
  
  static Future<GoogleSignInAccount?> getCurrentUser() async {
    return _googleSignIn.currentUser;
  }
}