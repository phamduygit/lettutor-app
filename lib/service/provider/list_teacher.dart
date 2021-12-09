import 'package:flutter/material.dart';
import 'package:lettutor_app/models/teacher.dart';

class ListTeacher extends ChangeNotifier {
  List<Teacher> list = listTeacher;

  favorite(Teacher teacher) {
    int index = list.indexOf(teacher);
    list[index].favorite();
    sort();
    notifyListeners();
  }

  void setListTeacher(List<String> listFavorite) {
    for (int i = 0; i < list.length; i++) {
      if (listFavorite.contains(list[i].id)) {
        list[i].isFavorite = 1;
      }
    }
    sort();
    notifyListeners();
  }


  void sort() {
    list.sort((a, b) => b.isFavorite.compareTo(a.isFavorite));
    // notifyListeners();
  }
}
