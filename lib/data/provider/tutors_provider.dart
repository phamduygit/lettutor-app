import 'package:flutter/material.dart';
import 'package:lettutor_app/data/api/tutor_api.dart';
import 'package:lettutor_app/data/provider/teacher_provider.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tutors_provider.g.dart';

@JsonSerializable()
class TutorsProvider extends ChangeNotifier {
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

  Future<bool> addFavorite(TeacherProvider teacherProvider) async {
    int index = -1;
    for (var i = 0; i < rows!.length; i++) {
      if (rows![i].userId == teacherProvider.userId) {
        index = i;
        break;
      }
    }
    if (index == -1) return false;
    if (rows![index].isFavorite == 0) {
      rows![index].isFavorite = 1;
    } else {
      rows![index].isFavorite = 0;
    }
    final result = await TutorAPI().addTutorToFavorites(rows![index].userId);
    rows!.sort((a, b) => b.isFavorite.compareTo(a.isFavorite));
    notifyListeners();
    return result;
  }
}
