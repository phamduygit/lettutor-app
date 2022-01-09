import 'package:flutter/material.dart';

class LocalApp with ChangeNotifier {
  String _accessToken = "";
  String get getAccessToken => _accessToken;
  void setAccessToken(String value) {
    _accessToken = value;
    notifyListeners();
  }
}