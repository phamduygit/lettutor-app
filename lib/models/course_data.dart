import 'package:lettutor_app/models/course.dart';

import 'package:json_annotation/json_annotation.dart';

part 'course_data.g.dart';

@JsonSerializable()
class CourseData {
  int count;
  List<Course>? rows;
  CourseData({this.count = 0, this.rows});
  factory CourseData.fromJson(Map<String, dynamic> json) =>
      _$CourseDataFromJson(json);
  Map<String, dynamic> toJson() => _$CourseDataToJson(this);
}
