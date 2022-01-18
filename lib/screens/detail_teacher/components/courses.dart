import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lettutor_app/models/course.dart';
import 'package:lettutor_app/screens/courses/components/course_detail.dart';

class Courses extends StatelessWidget {
  const Courses({
    Key? key,
    required this.courses,
  }) : super(key: key);
  final List<Course> courses;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Courses",
            style: TextStyle(fontSize: 16, color: mainColor),
          ).tr(),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                courses.length,
                (index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CourseDetail(
                          courseId: courses[index].id,
                        ),
                      ),
                    );
                  },
                  child: courseCard(
                    image: courses[index].imageUrl,
                    title: courses[index].name,
                    description: courses[index].description,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container courseCard(
      {required String image,
      required String title,
      required String description}) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      height: 300,
      child: Card(
        elevation: 5,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              image,
              width: 240,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 220,
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                maxLines: 2,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 220,
              child: Text(
                description,
                maxLines: 2,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
