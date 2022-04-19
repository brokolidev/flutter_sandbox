import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SampleProvider extends ChangeNotifier {
  String? _sessionKey;
  String? get sessionKey => _sessionKey;

  set sessionKey(value) {
    _sessionKey = value;
    notifyListeners();
  }

  Future<SharedPreferences?> fetchSessionKeyFromSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  SampleProvider() {
    fetchSessionKeyFromSharedPreferences();
    notifyListeners();
  }
}
