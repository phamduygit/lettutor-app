class Teacher {
  String name;
  List<String> specialties;
  String avatar;
  double rating;
  String interests;
  String description;
  Teacher({
    required this.name,
    required this.specialties,
    this.avatar = "",
    required this.rating,
    required this.interests,
    required this.description,
  });
}

List<Teacher> listTeacher = [
  Teacher(
    name: "April corpuz",
    specialties: ["English"],
    avatar: "assets/images/avatar.jpeg",
    rating: 4.5,
    interests: "abc",
    description: "doriem",
  ),
];
