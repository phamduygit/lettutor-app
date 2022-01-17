import 'package:lettutor_app/data/api/another_api.dart';
import 'package:lettutor_app/models/user_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'teacher_info.g.dart';

@JsonSerializable()
class TeacherInfo {
  String id;
  String userId;
  String video;
  String bio;
  String languages;
  String specialties;
  String interests;
  String experience;
  // ignore: non_constant_identifier_names
  UserInfo? User;
  TeacherInfo({
    this.id = "",
    this.userId = "",
    this.video = "",
    this.bio = "",
    this.languages = "",
    this.specialties = "",
    this.interests = "",
    this.experience = "",
    // ignore: non_constant_identifier_names
    this.User,
  });
  factory TeacherInfo.fromJson(Map<String, dynamic> json) =>
      _$TeacherInfoFromJson(json);
  Map<String, dynamic> toJson() => _$TeacherInfoToJson(this);
  
  Future<List<String>> converLanguages() async {
    var languageKeys = languages.split(",");
    List<String> results = [];
    for (String languageKey in languageKeys) {
      var languageName = await CommonAPI().getLanguageName(languageKey);
      results.add(languageName);
    }
    return results;
  }
}
