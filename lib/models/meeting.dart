class Meeting {
  String avatar;
  String name;
  DateTime date;
  Meeting({required this.avatar, required this.name, required this.date,});
}


List<Meeting> listMeeting = [
  Meeting(avatar: "assets/images/avatar.jpeg", name: "Pham Duy", date: DateTime.parse("2021-10-22 15:20:00")),
  Meeting(avatar: "assets/images/avatar1.jpeg", name: "Thanh Duc", date: DateTime.parse("2021-10-22 16:20:00")),
];