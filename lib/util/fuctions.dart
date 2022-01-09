import 'package:lettutor_app/data/constants.dart';
import 'package:lettutor_app/data/provider/topic.dart';
import 'package:lettutor_app/data/provider/user_provider.dart';

List<Topic> getTopic(List<String> selectedCourse) {
  List<Topic> result = [];
  for (final course in selectedCourse) {
    for (var i = 0; i < constLearnTopics.length; i++) {
      if (course == constLearnTopics[i].name) {
        result.add(constLearnTopics[i]);
      }
    }
  }
  return result;
}

List<Topic> getTest(List<String> selectedCourse) {
  List<Topic> result = [];
  for (final course in selectedCourse) {
    for (var i = 0; i < constTest.length; i++) {
      if (course == constTest[i].name) {
        result.add(constTest[i]);
      }
    }
  }
  print(result.length);
  return result;
}

List<String> getSelectedCourses(UserProvider user) {
  List<String> results = [];

 for (var i = 0; i < user.learnTopics!.length; i++) {
      results.add(user.learnTopics![i].name);
    }

 for (var i = 0; i < user.testPreparations!.length; i++) {
      results.add(user.testPreparations![i].name);
    }
  return results;
}

List<String> getIDTopic(List<Topic> topics) {
  List<String> results = [];
  for(var topic in topics) {
    results.add(topic.id.toString());
  }
  return results;
}