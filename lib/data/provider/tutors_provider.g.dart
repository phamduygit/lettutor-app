// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutors_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorsProvider _$TutorsProviderFromJson(Map<String, dynamic> json) =>
    TutorsProvider(
      count: json['count'] as int? ?? 0,
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => TeacherProvider.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TutorsProviderToJson(TutorsProvider instance) =>
    <String, dynamic>{
      'count': instance.count,
      'rows': instance.rows,
    };
