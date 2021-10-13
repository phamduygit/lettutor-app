import 'package:flutter/material.dart';
import 'components/end_drawer.dart';
import 'components/recommended_tutors.dart';
import 'components/teacher_card.dart';
import 'components/up_coming_lesson.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/avatar.jpeg"),
              ),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      endDrawer: const EndDrawer(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            UpComingLesson(),
            SizedBox(height: 5),
            RecommendedTutors(),
            SizedBox(height: 5),
            TeacherCard(),
            TeacherCard(),
            TeacherCard(),
          ],
        ),
      ),
    );
  }
}
