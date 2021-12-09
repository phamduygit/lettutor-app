import 'package:flutter/material.dart';

class LocalApp with ChangeNotifier {
  String _currentUserID = "";
  String get getCurrentUserID => _currentUserID;
  void setID(String id) {
    _currentUserID = id;
    notifyListeners();
  }
}