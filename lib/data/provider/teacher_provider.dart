import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor_app/data/api/tutor_api.dart';
import 'package:lettutor_app/models/review.dart';

part 'teacher_provider.g.dart';

@JsonSerializable()
class TeacherProvider {
  String id;
  String userId;
  String name;
  String country;
  String specialties;
  String avatar;
  String interests;
  String bio;
  String languages;
  List<Review>? feedbacks;
  int isFavorite;
  TeacherProvider({
    this.id = "",
    this.userId = "",
    this.name = "",
    this.country = "",
    this.specialties = "",
    this.avatar = "",
    this.interests = "",
    this.bio = "",
    this.languages = "",
    this.feedbacks,
    this.isFavorite = 0,
  });
  factory TeacherProvider.fromJson(Map<String, dynamic> json) =>
      _$TeacherProviderFromJson(json);
  Map<String, dynamic> toJson() => _$TeacherProviderToJson(this);
  List<String> convertSpecialties() {
    return specialties.split(",");
  }

  double getRating() {
    var result = feedbacks!.map((m) => m.rating).reduce((a, b) => a + b) /
        feedbacks!.length;
    return result;
  }
  Future<bool> addFavorite() async {
    if (isFavorite == 0) {
      isFavorite = 1;
    } else {
      isFavorite = 0;
    }
     // api
    final result = await TutorAPI().addTutorToFavorites(userId);
    return result;
  }
}
