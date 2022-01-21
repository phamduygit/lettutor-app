import 'package:json_annotation/json_annotation.dart';

part 'course_category.g.dart';

@JsonSerializable()
class CourseCategory {
  String id;
  String title;
  // ignore: non_constant_identifier_names
  String key;
  CourseCategory({
    required this.id,
    required this.title,
    // ignore: non_constant_identifier_names
    required this.key,
  });
  factory CourseCategory.fromJson(Map<String, dynamic> json) => _$CourseCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CourseCategoryToJson(this);
}
