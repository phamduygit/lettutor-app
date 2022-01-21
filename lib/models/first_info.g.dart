// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'first_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirstInfo _$FirstInfoFromJson(Map<String, dynamic> json) => FirstInfo(
      id: json['id'] as String? ?? "",
      email: json['email'] as String? ?? "",
      avatar: json['avatar'] as String? ?? "",
      name: json['name'] as String? ?? "",
      country: json['country'] as String? ?? "",
    );

Map<String, dynamic> _$FirstInfoToJson(FirstInfo instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'avatar': instance.avatar,
      'name': instance.name,
      'country': instance.country,
    };
