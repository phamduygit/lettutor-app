// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      imageUrl: json['imageUrl'] as String? ?? "",
      description: json['description'] as String? ?? "",
      level: json['level'] as String? ?? "",
      reason: json['reason'] as String? ?? "",
      purpose: json['purpose'] as String? ?? "",
      topics: (json['topics'] as List<dynamic>?)
          ?.map((e) => CourseTopic.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CourseCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'level': instance.level,
      'reason': instance.reason,
      'purpose': instance.purpose,
      'topics': instance.topics,
      'categories': instance.categories,
    };
