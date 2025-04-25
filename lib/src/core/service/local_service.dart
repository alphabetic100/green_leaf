import 'dart:developer';
import 'package:get/route_manager.dart';
import 'package:green_leaf/src/core/repo/firebase_repo.dart';
import 'package:green_leaf/src/feature/auth/presentation/view/sign_in/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalService {
  static const String _tokenKey = 'token';

  static late SharedPreferences _preferences;

  static String? _token;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    _token = _preferences.getString(_tokenKey);
  }

  static bool hasToken() {
    return _preferences.containsKey(_tokenKey);
  }

  static Future<void> saveToken(String token, String id) async {
    try {
      await _preferences.setString(_tokenKey, token);
      _token = token;
    } catch (e) {
      log('Error saving token: $e');
    }
  }

  static Future<void> logoutUser() async {
    try {
      await _preferences.clear();
      _token = null;
      await FirebaseRepo().signOut();
      await goToLogin();
    } catch (e) {
      log('Error during logout: $e');
    }
  }

  static Future<void> goToLogin() async {
    Get.offAllNamed(SignInScreen.routeName);
  }

  static String? get token => _token;
}
