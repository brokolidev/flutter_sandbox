import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SampleProvider extends ChangeNotifier {
  String? _sessionKey;
  String? get sessionKey => _sessionKey;

  set sessionKey(value) {
    _sessionKey = value;
    notifyListeners();
  }

  Future<String?> fetchApiKey() async {
    var url = Uri.parse('//localhost/api/login');
    // var response =
    //     await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    var response = await http.get(url);
    _sessionKey = response.body;
    notifyListeners();
    return response.body;
  }

  Future<SharedPreferences?> fetchSessionKeyFromSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }
}
