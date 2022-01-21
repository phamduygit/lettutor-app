import 'package:lettutor_app/models/schedule_detail.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schedule.g.dart';

@JsonSerializable()
class Schedule {
  String id;
  String tutorId;
  String startTime;
  String endTime;
  int startTimestamp;
  int endTimestamp;
  int createdAtTimeStamp;
  bool isBooked;
  List<ScheduleDetail>? scheduleDetails;
  Schedule({
    this.id = "",
    this.tutorId = "",
    this.startTime = "",
    this.endTime = "",
    this.startTimestamp = 0,
    this.createdAtTimeStamp = 0,
    this.endTimestamp = 0,
    this.isBooked = false,
    this.scheduleDetails,
  });
  factory Schedule.fromJson(Map<String, dynamic> json) => _$ScheduleFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}
