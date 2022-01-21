// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeetingData _$MeetingDataFromJson(Map<String, dynamic> json) => MeetingData(
      count: json['count'] as int? ?? 0,
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => Meeting.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MeetingDataToJson(MeetingData instance) =>
    <String, dynamic>{
      'count': instance.count,
      'rows': instance.rows,
    };
