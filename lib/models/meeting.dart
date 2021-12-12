import 'package:intl/intl.dart';

class Meeting {
  String id;
  String userID;
  String teacherID;
  String avatar;
  String name;
  DateTime date;
  int status;
  Meeting({
    required this.id,
    required this.userID,
    required this.teacherID,
    required this.avatar,
    required this.name,
    required this.date,
    required this.status,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userID': userID,
      'teacherID': teacherID,
      'avatar': avatar,
      'name': name,
      'date': DateFormat('dd/MM/yyyy HH:mm:ss').format(date),
      'status': status,
    };
  }
}

