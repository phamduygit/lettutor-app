// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProvider _$UserProviderFromJson(Map<String, dynamic> json) => UserProvider(
      id: json['id'] as String? ?? "1",
      name: json['name'] as String? ?? "",
      avatar: json['avatar'] as String? ??
          "https://images.unsplash.com/photo-1565604113656-e92be3ec1b15?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      email: json['email'] as String? ?? "",
      country: json['country'] as String? ?? "Vietnam",
      phone: json['phone'] as String? ?? "",
      level: json['level'] as String? ?? "Beginer",
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
      language: json['language'] as String? ?? "Vietnamese",
      learnTopics: (json['learnTopics'] as List<dynamic>?)
          ?.map((e) => Topic.fromJson(e as Map<String, dynamic>))
          .toList(),
      testPreparations: (json['testPreparations'] as List<dynamic>?)
          ?.map((e) => Topic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserProviderToJson(UserProvider instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'email': instance.email,
      'country': instance.country,
      'phone': instance.phone,
      'level': instance.level,
      'language': instance.language,
      'learnTopics': instance.learnTopics,
      'birthday': instance.birthday?.toIso8601String(),
      'testPreparations': instance.testPreparations,
    };
