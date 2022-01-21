// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeacherInfo _$TeacherInfoFromJson(Map<String, dynamic> json) => TeacherInfo(
      id: json['id'] as String? ?? "",
      userId: json['userId'] as String? ?? "",
      video: json['video'] as String? ?? "",
      bio: json['bio'] as String? ?? "",
      languages: json['languages'] as String? ?? "",
      specialties: json['specialties'] as String? ?? "",
      interests: json['interests'] as String? ?? "",
      experience: json['experience'] as String? ?? "",
      isFavorite: json['isFavorite'] as bool? ?? false,
      User: json['User'] == null
          ? null
          : UserInfo.fromJson(json['User'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeacherInfoToJson(TeacherInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'video': instance.video,
      'bio': instance.bio,
      'languages': instance.languages,
      'specialties': instance.specialties,
      'interests': instance.interests,
      'experience': instance.experience,
      'isFavorite': instance.isFavorite,
      'User': instance.User,
    };
