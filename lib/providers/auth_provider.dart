import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  String? _phone;

  bool get isLoggedIn => _isLoggedIn;
  String? get phone => _phone;

  Future<void> loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    _phone = prefs.getString('phone');
    notifyListeners();
  }

  Future<void> sendOtp(String phone) async {
    // TODO: Implement OTP sending logic
    _phone = phone;
    notifyListeners();
  }

  Future<bool> verifyOtp(String phone, String code) async {
    // TODO: Implement OTP verification logic
    _isLoggedIn = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('phone', phone);
    notifyListeners();
    return true;
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    await prefs.remove('phone');
    _isLoggedIn = false;
    _phone = null;
    notifyListeners();
  }
}
