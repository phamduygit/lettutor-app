import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor_app/models/meeting.dart';

part 'meeting_data.g.dart';

@JsonSerializable()
class MeetingData {
  int count;
  List<Meeting>? rows;
  MeetingData({
    this.count = 0,
    this.rows
  });
      factory MeetingData.fromJson(Map<String, dynamic> json) => _$MeetingDataFromJson(json);
  Map<String, dynamic> toJson() => _$MeetingDataToJson(this);
}