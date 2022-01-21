// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeetingInfo _$MeetingInfoFromJson(Map<String, dynamic> json) => MeetingInfo(
      room: json['room'] as String? ?? "",
      roomName: json['roomName'] as String? ?? "",
      userBeCalled: json['userBeCalled'] == null
          ? null
          : UserProvider.fromJson(json['userBeCalled'] as Map<String, dynamic>),
      startTime: json['startTime'] as int? ?? 0,
      endSession: json['endSession'] as int? ?? 0,
      bookingId: json['bookingId'] as String? ?? "",
      userCall: json['userCall'] == null
          ? null
          : UserProvider.fromJson(json['userCall'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MeetingInfoToJson(MeetingInfo instance) =>
    <String, dynamic>{
      'room': instance.room,
      'roomName': instance.roomName,
      'userBeCalled': instance.userBeCalled,
      'userCall': instance.userCall,
      'startTime': instance.startTime,
      'endSession': instance.endSession,
      'bookingId': instance.bookingId,
    };
