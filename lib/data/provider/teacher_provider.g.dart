// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeacherProvider _$TeacherProviderFromJson(Map<String, dynamic> json) =>
    TeacherProvider(
      id: json['id'] as String? ?? "",
      userId: json['userId'] as String? ?? "",
      name: json['name'] as String? ?? "",
      country: json['country'] as String? ?? "",
      specialties: json['specialties'] as String? ?? "",
      avatar: json['avatar'] as String? ?? "",
      interests: json['interests'] as String? ?? "",
      bio: json['bio'] as String? ?? "",
      languages: json['languages'] as String? ?? "",
      feedbacks: (json['feedbacks'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TeacherProviderToJson(TeacherProvider instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'country': instance.country,
      'specialties': instance.specialties,
      'avatar': instance.avatar,
      'interests': instance.interests,
      'bio': instance.bio,
      'languages': instance.languages,
      'feedbacks': instance.feedbacks,
    };
