import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor_app/models/course_category.dart';
import 'package:lettutor_app/models/course_topic.dart';

part 'course.g.dart';

@JsonSerializable()
class Course {
  String id;
  String name;
  String imageUrl;
  String description;
  String level;
  String reason;
  String purpose;
  List<CourseTopic>? topics;
  List<CourseCategory>? categories;
  Course({
    this.id = "",
    this.name = "",
    this.imageUrl = "",
    this.description = "",
    this.level = "",
    this.reason = "",
    this.purpose = "",
    this.topics,
    this.categories,
  });
  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
