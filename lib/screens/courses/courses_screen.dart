import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lettutor_app/data/api/course_api.dart';
import 'package:lettutor_app/models/course.dart';
import 'package:lettutor_app/models/course_data.dart';
import 'components/courses_card.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  CourseData courseData = CourseData();
  List<Course> englishForBeginner = [];
  List<Course> englishForTraveling = [];
  List<Course> englishBusiness = [];
  List<Course> englishForKid = [];
  Future<void> getListCourses() async {
    final value = await CourseAPI().getListCourses(1, 100);
    courseData = CourseData.fromJson(value["data"]);
    // print(courseData.rows);
    for (var course in courseData.rows!) {
      if (course.categories![0].title == "English for Traveling") {
        setState(() {
          englishForTraveling.add(course);
        });
      }
      if (course.categories![0].title == "English for Beginners") {
        setState(() {
          englishBusiness.add(course);
        });
      }
      if (course.categories![0].title == "Business English") {
        setState(() {
          englishForBeginner.add(course);
        });
      }
      if (course.categories![0].title == "English for Kid") {
        setState(() {
          englishForKid.add(course);
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getListCourses();
  }

  @override
  Widget build(BuildContext context) {
    // final List<Course> listEnglishForBeginner = listCourse.where((element) => element.category == "English For Beginners").toList();
    // final List<Course> listConversationalEnglish = listCourse.where((element) => element.category == "Conversational English").toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Courses").tr(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            categoryCourse(courses: englishForBeginner, title: "English for beginners"),
            categoryCourse(courses: englishForKid, title: "English for kids"),
            categoryCourse(courses: englishForTraveling, title: "English for traveling"),
            categoryCourse(courses: englishBusiness, title: "Business English"),
          ],
        ),
      ),
    );
  }

  Column categoryCourse({required List<Course> courses, required String title}) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 350,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: courses.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.fromLTRB(defaultPadding, 10, 10, 10),
                  child: CoursesCard(course: courses[index]),
                );
              },
            ),
          ),
        ],
      );
  }
}
