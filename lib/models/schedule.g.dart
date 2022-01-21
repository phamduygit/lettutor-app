// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schedule _$ScheduleFromJson(Map<String, dynamic> json) => Schedule(
      id: json['id'] as String? ?? "",
      tutorId: json['tutorId'] as String? ?? "",
      startTime: json['startTime'] as String? ?? "",
      endTime: json['endTime'] as String? ?? "",
      startTimestamp: json['startTimestamp'] as int? ?? 0,
      createdAtTimeStamp: json['createdAtTimeStamp'] as int? ?? 0,
      endTimestamp: json['endTimestamp'] as int? ?? 0,
      isBooked: json['isBooked'] as bool? ?? false,
      scheduleDetails: (json['scheduleDetails'] as List<dynamic>?)
          ?.map((e) => ScheduleDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ScheduleToJson(Schedule instance) => <String, dynamic>{
      'id': instance.id,
      'tutorId': instance.tutorId,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'startTimestamp': instance.startTimestamp,
      'endTimestamp': instance.endTimestamp,
      'createdAtTimeStamp': instance.createdAtTimeStamp,
      'isBooked': instance.isBooked,
      'scheduleDetails': instance.scheduleDetails,
    };
