import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_app/contants.dart';
import 'package:lettutor_app/models/courses.dart';
import 'package:lettutor_app/screens/courses/components/title_line.dart';

import 'course_detail_card.dart';

class CourseDetail extends StatelessWidget {
  const CourseDetail({Key? key, required this.course}) : super(key: key);
  final Course course;
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Courses Detail"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                CoursesDetailCard(course: course, widthScreen: widthScreen),
                const SizedBox(height: 15),
                const TitleLine(title: "Overview"),
                const IconAndTitle(
                  icon: CupertinoIcons.question_circle,
                  title: "Why take this course",
                  colorIcon: Colors.red,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: defaultPadding * 2, right: defaultPadding, top: 5),
                  child: Text(course.reason),
                ),
                const IconAndTitle(
                  icon: CupertinoIcons.question_circle,
                  title: "What will you be able to do",
                  colorIcon: Colors.red,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: defaultPadding * 2, right: defaultPadding, top: 5),
                  child: Text(course.value),
                ),
                const TitleLine(title: "Experience Level"),
                const SizedBox(height: 5),
                IconAndTitle(
                  icon: Icons.people_alt_outlined,
                  title: course.experienceLevel,
                  colorIcon: Colors.blue,
                ),
                const TitleLine(title: "Course Length"),
                const SizedBox(height: 5),
                IconAndTitle(
                  icon: Icons.topic,
                  title: "${course.listTopic.length} topics",
                  colorIcon: Colors.blue,
                ),
                const TitleLine(title: "Course Length"),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(
                    left: defaultPadding * 2,
                    right: defaultPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      course.listTopic.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          "${index + 1}. ${course.listTopic[index]}",
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconAndTitle extends StatelessWidget {
  const IconAndTitle({
    Key? key,
    required this.icon,
    required this.title,
    required this.colorIcon,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final Color colorIcon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: colorIcon),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
