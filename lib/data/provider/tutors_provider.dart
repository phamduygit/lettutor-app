import 'package:flutter/material.dart';
import 'package:lettutor_app/data/provider/teacher_provider.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tutors_provider.g.dart';

@JsonSerializable()
class TutorsProvider  extends ChangeNotifier  {
  int count;
  List<TeacherProvider>? rows;
  TutorsProvider({this.count = 0, this.rows});
  factory TutorsProvider.fromJson(Map<String, dynamic> json) =>
      _$TutorsProviderFromJson(json);
  Map<String, dynamic> toJson() => _$TutorsProviderToJson(this);

  void setTutorsProvider(TutorsProvider other) {
    count = other.count;
    rows = other.rows;
    notifyListeners();
  }
}