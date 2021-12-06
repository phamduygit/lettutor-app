import 'package:flutter/material.dart';
class User extends ChangeNotifier{
  String id;
  String fullName;
  String avatar;
  String email;
  List<String> favorites;
  
  User({
    this.id = "1",
    this.fullName = "",
    this.avatar = "https://cdn-icons-png.flaticon.com/512/848/848043.png",
    this.email = "",
    required this.favorites,
  });
  List<String> get favorite => favorites;
  bool isFavorite(String teacherID) {
    return favorites.contains(teacherID);
  }
  void like(String teacherID) {
    if (favorites.contains(teacherID)) {
      favorites.remove(teacherID);
    } else {
      favorites.add(teacherID);
    }
    notifyListeners();
  }
  void updateUser(User newUser) {
    id = newUser.id;
    fullName = newUser.fullName;
    avatar = newUser.avatar;
    email = newUser.email;
    favorites = newUser.favorites;
    notifyListeners();
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'avatar': avatar,
      'email': email,
    };
  }
}
