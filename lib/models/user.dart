import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class User extends ChangeNotifier{
  String id;
  String fullName;
  String avatar;
  String email;
  String country;
  String phone;
  String level;
  DateTime birthDay;
  List<String> target;
  List<String> favorites;
  
  User({
    this.id = "1",
    this.fullName = "",
    this.avatar = "https://images.unsplash.com/photo-1565604113656-e92be3ec1b15?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    this.email = "",
    this.country = "Vietnam",
    this.phone = "",
    this.level = "Beginer",
    required this.birthDay,
    required this.target,
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
    country = newUser.country;
    phone = newUser.phone;
    birthDay = newUser.birthDay;
    target = newUser.target;
    level = newUser.level;
    notifyListeners();
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'avatar': avatar,
      'email': email,
      'country': country,
      'phone': phone,
      'birthday': DateFormat('dd/MM/yyyy HH:mm:ss').format(birthDay),
      'target': target.join("-"),
      'level': level,
    };
    //id, fullName, avatar, email, country, phone, birthday, target, level
  }
}
