import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor_app/data/provider/topic.dart';

part 'user_provider.g.dart';

@JsonSerializable()
class UserProvider extends ChangeNotifier {
  String id;
  String name;
  String avatar;
  String email;
  String country;
  String phone;
  String level;
  String language;
  List<Topic>? learnTopics;
  DateTime? birthday;
  List<Topic>? testPreparations;

  UserProvider({
    this.id = "1",
    this.name = "",
    this.avatar =
        "https://images.unsplash.com/photo-1565604113656-e92be3ec1b15?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    this.email = "",
    this.country = "Vietnam",
    this.phone = "",
    this.level = "Beginer",
    this.birthday,
    this.language = "Vietnamese",
    this.learnTopics,
    this.testPreparations,
  });

  void updateUser(UserProvider newUser) {
    id = newUser.id;
    name = newUser.name;
    avatar = newUser.avatar;
    email = newUser.email;
    country = newUser.country;
    phone = newUser.phone;
    birthday = newUser.birthday;
    level = newUser.level;
    language = newUser.language;
    learnTopics = newUser.learnTopics;
    testPreparations = newUser.testPreparations;
    notifyListeners();
  }

  factory UserProvider.fromJson(Map<String, dynamic> json) =>
      _$UserProviderFromJson(json);
  Map<String, dynamic> toJson() => _$UserProviderToJson(this);
}
