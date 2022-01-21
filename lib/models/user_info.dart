import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor_app/models/course.dart';
import 'package:lettutor_app/models/review.dart';

part 'user_info.g.dart';

@JsonSerializable()
class UserInfo {
  String id;
  String email;
  String avatar;
  String country;
  String name;
  List<Review>? feedbacks;
  List<Course>? courses;
  UserInfo({
    this.id = "",
    this.email = "",
    this.avatar = "",
    this.country = "",
    this.name = "",
    this.feedbacks,
    this.courses
  });
    factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
  double getRating() {
    var result = feedbacks!.map((m) => m.rating).reduce((a, b) => a + b) / feedbacks!.length;
    return result;
  }
}
