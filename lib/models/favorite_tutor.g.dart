// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_tutor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteTutor _$FavoriteTutorFromJson(Map<String, dynamic> json) =>
    FavoriteTutor(
      id: json['id'] as String? ?? "",
      firstId: json['firstId'] as String? ?? "",
      secondId: json['secondId'] as String? ?? "",
    );

Map<String, dynamic> _$FavoriteTutorToJson(FavoriteTutor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstId': instance.firstId,
      'secondId': instance.secondId,
    };
