// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleDetail _$ScheduleDetailFromJson(Map<String, dynamic> json) =>
    ScheduleDetail(
      startPeriodTimestamp: json['startPeriodTimestamp'] as int? ?? 0,
      endPeriodTimestamp: json['endPeriodTimestamp'] as int? ?? 0,
      id: json['id'] as String? ?? "",
      scheduleId: json['scheduleId'] as String? ?? "",
      startPeriod: json['startPeriod'] as String? ?? "",
      endPeriod: json['endPeriod'] as String? ?? "",
      isBooked: json['isBooked'] as bool? ?? false,
    );

Map<String, dynamic> _$ScheduleDetailToJson(ScheduleDetail instance) =>
    <String, dynamic>{
      'startPeriodTimestamp': instance.startPeriodTimestamp,
      'endPeriodTimestamp': instance.endPeriodTimestamp,
      'id': instance.id,
      'scheduleId': instance.scheduleId,
      'startPeriod': instance.startPeriod,
      'endPeriod': instance.endPeriod,
      'isBooked': instance.isBooked,
    };
