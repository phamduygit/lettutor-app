import 'package:flutter/material.dart';
import 'package:lettutor_app/models/course.dart';
import 'package:lettutor_app/util/fuctions.dart';

import 'course_detail.dart';

class CoursesCard extends StatelessWidget {
  const CoursesCard({
    Key? key,
    required this.course,
  }) : super(key: key);
  final Course course;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseDetail(
              courseId: course.id,
            ),
          ),
        );
      },
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                course.imageUrl,
                fit: BoxFit.fill,
                width: 250,
                // height: 180,
              ),
            ),
            SizedBox(
              width: 226,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    course.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    course.description,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${convertLevel(course.level)} - ${course.topics!.length} Lessons",
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
