import 'package:flutter/material.dart';
import 'package:lettutor_app/models/meeting.dart';

class ListMeeting extends ChangeNotifier {
  final List<Meeting> _list = [];
  
  List<Meeting> get list => _list;

  void setListMeeting(List<Meeting> anotherList) {
    _list.clear();
    _list.addAll(anotherList);
    notifyListeners();
  }
  void addNewMeeting(Meeting newMeeting) {
    _list.add(newMeeting);
    notifyListeners();
  }
  void deleteMeeting(Meeting meeting) {
    int index = _list.indexWhere((element) => element.id == meeting.id);
    _list.removeAt(index);
    notifyListeners();
  }

  List<Meeting> getUpcomming() {
    List<Meeting> upComming = _list.where((element) => element.date.isAfter(DateTime.now())).toList();
    return upComming;
  }
  void updateOneMeeting(Meeting meeting) {
    int index = _list.indexWhere((element) => element.id == meeting.id);
    _list[index] = meeting;
    notifyListeners();
  }
}