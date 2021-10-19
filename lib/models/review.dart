import 'package:flutter/material.dart';

class Review {
  String comment;
  int numberOfStar;
  DateTime date;
  String username;
  String avatar;
  Review({
    required this.comment,
    required this.avatar,
    required this.numberOfStar,
    required this.date,
    required this.username,
  });
}

List<Review> reviews = [
  Review(
    comment: "Very good",
    avatar: "assets/images/avatar.jpeg",
    numberOfStar: 5,
    date: DateTime.now(),
    username: "Username1",
  ),
  Review(
    comment: "Very bad",
    avatar: "assets/images/avatar1.jpeg",
    numberOfStar: 3,
    date: DateTime.now(),
    username: "Username1]2",
  ),
];
