import 'package:json_annotation/json_annotation.dart';

part 'schedule_detail.g.dart';

@JsonSerializable()
class ScheduleDetail {
  int startPeriodTimestamp;
  int endPeriodTimestamp;
  String id;
  String scheduleId;
  String startPeriod;
  String endPeriod;
  bool isBooked;
  ScheduleDetail({
    this.startPeriodTimestamp = 0,
    this.endPeriodTimestamp = 0,
    this.id = "",
    this.scheduleId = "",
    this.startPeriod = "",
    this.endPeriod = "",
    this.isBooked = false,
  });
    factory ScheduleDetail.fromJson(Map<String, dynamic> json) => _$ScheduleDetailFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleDetailToJson(this);
}
