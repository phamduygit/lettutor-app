import 'package:lettutor_app/models/message.dart';

class People {
  String avatar;
  String username;
  List<Message> messages;
  People(
      {required this.avatar, required this.username, required this.messages});
}

List<People> persons = [
  People(
    avatar: "assets/images/avatar.jpeg",
    username: "Username1",
    messages: [
      Message(
        content: "Hello",
        dateTime: DateTime.parse("2021-10-19 20:15:00Z"),
        userID: "1",
      ),
      Message(
        content: "Hello",
        dateTime: DateTime.parse("2021-10-19 20:16:00Z"),
        userID: "1",
      ),
      Message(
        content: "Hi I'm Duy",
        dateTime: DateTime.parse("2021-10-19 20:20:00Z"),
        userID: "1",
      ),
    ],
  ),
  People(
    avatar: "assets/images/avatar1.jpeg",
    username: "Username2",
    messages: [
      Message(
        content: "Hello",
        dateTime: DateTime.parse("2021-10-19 20:15:00Z"),
        userID: "1",
      ),
      Message(
        content: "Hello",
        dateTime: DateTime.parse("2021-10-19 20:16:00Z"),
        userID: "1",
      ),
      Message(
        content: "Hello",
        dateTime: DateTime.parse("2021-10-19 20:17:00Z"),
        userID: "1",
      ),
    ],
  )
];
