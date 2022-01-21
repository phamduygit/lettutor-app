import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor_app/data/provider/user_provider.dart';

part 'meeting_info.g.dart';

@JsonSerializable()
class MeetingInfo {
  String room;
  String roomName;
  UserProvider? userBeCalled;
  UserProvider? userCall;
  int startTime;
  int endSession;
  String bookingId;
  MeetingInfo({
    this.room = "",
    this.roomName = "",
    this.userBeCalled,
    this.startTime = 0,
    this.endSession = 0,
    this.bookingId = "",
    this.userCall,
  });
  factory MeetingInfo.fromJson(Map<String, dynamic> json) =>
      _$MeetingInfoFromJson(json);
  Map<String, dynamic> toJson() => _$MeetingInfoToJson(this);
}
