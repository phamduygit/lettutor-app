
import 'package:intl/intl.dart';

class Review {
  String id;
  String userID;
  String teacherID;
  String comment;
  int numberOfStar;
  DateTime date;
  String username;
  String avatar;
  Review({
    required this.id,
    required this.userID,
    required this.teacherID,
    required this.comment,
    required this.avatar,
    required this.numberOfStar,
    required this.date,
    required this.username,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userID': userID,
      'teacherID': teacherID,
      'comment': comment,
      'avatar': avatar,
      'numberOfStar': numberOfStar,
      'date': DateFormat('dd/MM/yyyy HH:mm:ss').format(date),
      'username': username,
    };
  }
}

List<Review> reviews = [
  // Review(
  //   comment: "Very good",
  //   avatar: "assets/images/avatar.jpeg",
  //   numberOfStar: 5,
  //   date: DateTime.now(),
  //   username: "Username1",
  // ),
  // Review(
  //   comment: "Very bad",
  //   avatar: "assets/images/avatar1.jpeg",
  //   numberOfStar: 3,
  //   date: DateTime.now(),
  //   username: "Username12",
  // ),
];
