import 'package:json_annotation/json_annotation.dart';

part 'course_topic.g.dart';

@JsonSerializable()
class CourseTopic {
  String id;
  String courseId;
  int orderCourse;
  String name;
  String nameFile;
  CourseTopic({
    required this.id,
    required this.courseId,
    required this.orderCourse,
    required this.name,
    required this.nameFile,
  });
  factory CourseTopic.fromJson(Map<String, dynamic> json) =>
      _$CourseTopicFromJson(json);
  Map<String, dynamic> toJson() => _$CourseTopicToJson(this);
}
