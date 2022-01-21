import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:lettutor_app/data/api/course_api.dart';
import 'package:lettutor_app/models/course.dart';
import 'package:lettutor_app/screens/courses/components/pdf_screen.dart';
import 'package:lettutor_app/screens/courses/components/title_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lettutor_app/util/fuctions.dart';
import 'course_detail_card.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({
    Key? key,
    required this.courseId,
  }) : super(key: key);
  final String courseId;

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  Course course = Course();
  bool _isLoading = true;
  Future getCourseById() async {
    setState(() {
      _isLoading = true;
    });
    final value = await CourseAPI().getCourseById(widget.courseId);
    course = Course.fromJson(value["data"]);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getCourseById();
  }

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Courses Detail").tr(),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      CoursesDetailCard(
                          course: course, widthScreen: widthScreen),
                      const SizedBox(height: 15),
                      TitleLine(title: tr("Overview")),
                      IconAndTitle(
                        icon: CupertinoIcons.question_circle,
                        title: tr("Why take this course"),
                        colorIcon: Colors.red,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: defaultPadding * 2,
                            right: defaultPadding,
                            top: 5),
                        child: Text(course.reason),
                      ),
                      IconAndTitle(
                        icon: CupertinoIcons.question_circle,
                        title: tr("What will you be able to do"),
                        colorIcon: Colors.red,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: defaultPadding * 2,
                            right: defaultPadding,
                            top: 5),
                        child: Text(course.purpose),
                      ),
                      TitleLine(title: tr("Experience Level")),
                      const SizedBox(height: 5),
                      IconAndTitle(
                        icon: Icons.people_alt_outlined,
                        title: convertLevel(course.level),
                        colorIcon: Colors.blue,
                      ),
                      TitleLine(title: tr("Course Length")),
                      const SizedBox(height: 5),
                      IconAndTitle(
                        icon: Icons.topic,
                        title: "${course.topics!.length} ${tr("topics")}",
                        colorIcon: Colors.blue,
                      ),
                      TitleLine(title: tr("List topics")),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: defaultPadding * 2,
                          right: defaultPadding,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            course.topics!.length,
                            (index) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PDFScreen(
                                        url: course.topics![index].nameFile,
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  "${index + 1}. ${course.topics![index].name}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
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
