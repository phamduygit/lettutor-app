import 'package:flutter/material.dart';
import 'package:lettutor_app/models/review.dart';
import 'package:lettutor_app/models/teacher.dart';
import 'package:lettutor_app/data/provider/user_provider.dart';

class ListReview extends ChangeNotifier {
  final List<Review> _list = [];

  void setListReview(List<Review> listReview) {
    _list.clear();
    _list.addAll(listReview);
    notifyListeners();
  }
  List<Review> getReviewOfTeacher(Teacher teacher) {
    return _list.where((element) => element.teacherID == teacher.id).toList();
  }
  Review? getOneReview(String teacherID, UserProvider user) {
    return _list.firstWhere((element) => element.teacherID == teacherID && element.userID == user.id);
  }
  void addNewReivew(Review review) {
    _list.add(review);
    notifyListeners();
  }
  void updateReview(Review review) {
    int index = _list.indexWhere((element) => element.id == review.id);
    _list[index] = review;
    notifyListeners();
  }
}