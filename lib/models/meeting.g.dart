// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meeting _$MeetingFromJson(Map<String, dynamic> json) => Meeting(
      id: json['id'] as String? ?? "",
      userId: json['userId'] as String? ?? "",
      tutorMeetingLink: json['tutorMeetingLink'] as String? ?? "",
      studentMeetingLink: json['studentMeetingLink'] as String? ?? "",
    );

Map<String, dynamic> _$MeetingToJson(Meeting instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'tutorMeetingLink': instance.tutorMeetingLink,
      'studentMeetingLink': instance.studentMeetingLink,
    };
