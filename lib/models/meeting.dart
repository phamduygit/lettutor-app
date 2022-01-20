import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor_app/models/meeting_info.dart';

part 'meeting.g.dart';

@JsonSerializable()
class Meeting {
  String id;
  String userId;
  String tutorMeetingLink;
  String studentMeetingLink;
  Meeting({
    this.id = "",
    this.userId = "",
    this.tutorMeetingLink = "",
    this.studentMeetingLink = "",
  });
  factory Meeting.fromJson(Map<String, dynamic> json) =>
      _$MeetingFromJson(json);
  Map<String, dynamic> toJson() => _$MeetingToJson(this);
  MeetingInfo getTutor() {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String handleString = studentMeetingLink.replaceAll("/call/?token=", "");
    List<String> splitString = handleString.split(".");
    String encoded = splitString[1];
    if (encoded.length % 4 > 0) {
      encoded += '=' * (4 - encoded.length % 4); // as suggested by Albert221
    }
    String decoded = stringToBase64.decode(encoded);
    MeetingInfo meetingInfo =
        MeetingInfo.fromJson(jsonDecode(decoded));
    return meetingInfo;
  }
}
