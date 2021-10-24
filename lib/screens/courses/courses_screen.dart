import 'package:flutter/material.dart';
import 'package:lettutor_app/contants.dart';
import 'package:lettutor_app/models/courses.dart';

import 'components/courses_card.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final List<Course> listEnglishForBeginner = listCourse.where((element) => element.category == "English For Beginners").toList();
    final List<Course> listConversationalEnglish = listCourse.where((element) => element.category == "Conversational English").toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Courses"),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Text(
                "English for begingers",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 360,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listEnglishForBeginner.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.fromLTRB(defaultPadding, 10, 10, 10),
                    child: CoursesCard(course: listEnglishForBeginner[index]),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Text(
                "Conversational English",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 360,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listConversationalEnglish.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.fromLTRB(defaultPadding, 10, 10, 10),
                    child: CoursesCard(course: listConversationalEnglish[index]),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
