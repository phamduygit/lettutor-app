// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      id: json['id'] as String? ?? "",
      email: json['email'] as String? ?? "",
      avatar: json['avatar'] as String? ?? "",
      country: json['country'] as String? ?? "",
      name: json['name'] as String? ?? "",
      feedbacks: (json['feedbacks'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'avatar': instance.avatar,
      'country': instance.country,
      'name': instance.name,
      'feedbacks': instance.feedbacks,
    };
