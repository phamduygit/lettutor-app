import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor_app/models/meeting.dart';

part 'meeting_data.g.dart';

@JsonSerializable()
class MeetingData extends ChangeNotifier {
  int count;
  List<Meeting>? rows;
  MeetingData({this.count = 0, this.rows});
  factory MeetingData.fromJson(Map<String, dynamic> json) =>
      _$MeetingDataFromJson(json);
  Map<String, dynamic> toJson() => _$MeetingDataToJson(this);
  void cancelMeeting(Meeting meeting) {
    int idx = rows!.indexWhere((e) => e.id == meeting.id);
    rows!.removeAt(idx);
    notifyListeners();
  }

  void setMeetingData(MeetingData meetingData) {
    count = meetingData.count;
    rows = meetingData.rows;
    notifyListeners();
  }
}
