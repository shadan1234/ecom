import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');
  bool _isFirstLaunch = true;

  Locale get locale => _locale;
  bool get isFirstLaunch => _isFirstLaunch;

  Future<void> loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final langCode = prefs.getString('locale');
    _isFirstLaunch = !(prefs.getBool('localeSet') ?? false);
    if (langCode != null) {
      _locale = Locale(langCode);
    }
    notifyListeners();
  }

  Future<void> setLocale(String langCode) async {
    _locale = Locale(langCode);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', langCode);
    await prefs.setBool('localeSet', true);
    _isFirstLaunch = false;
    notifyListeners();
  }
}
