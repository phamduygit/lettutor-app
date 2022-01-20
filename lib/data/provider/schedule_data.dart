import 'package:flutter/foundation.dart';
import 'package:lettutor_app/models/schedule.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schedule_data.g.dart';

@JsonSerializable()
class ScheduleData extends ChangeNotifier{
  String meessage;
  List<Schedule>? data;
  ScheduleData({
    this.meessage = "",
    this.data,
  });
  factory ScheduleData.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDataFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleDataToJson(this);
  List<int> getScheduleDay() {
    DateTime today = DateTime.now();
    List<int> result = [];
    for (var schedule in data!) {
      if (schedule.startTimestamp > today.millisecondsSinceEpoch) {
        result.add(schedule.startTimestamp);
      }
    }
    return result;
  }
  List<Schedule> getScheduleInDay(DateTime aDay) {
    List<Schedule> results = [];
    if (data == null) return [];
    for (var schedule in data!) {
      DateTime scheduleDate = DateTime.fromMillisecondsSinceEpoch(schedule.startTimestamp);

      if (scheduleDate.day == aDay.day) {
        results.add(schedule);
      }
    }
    results.sort((a, b) => a.startTimestamp.compareTo(b.startTimestamp));
    return results;
  }
}
