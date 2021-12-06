import 'package:flutter/material.dart';
import 'package:lettutor_app/models/teacher.dart';
import 'package:lettutor_app/models/user.dart';
import 'package:lettutor_app/screens/detail_teacher/detail_teacher.dart';
import 'package:provider/provider.dart';
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
              icon:  CircleAvatar(
                backgroundImage: NetworkImage(context.watch<User>().avatar),
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
          children: [
            const UpComingLesson(),
            const SizedBox(height: 5),
            const RecommendedTutors(),
            const SizedBox(height: 5),
            Column(
              children: List.generate(
                listTeacher.length,
                (index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailTeacher(
                          teacher: listTeacher[index],
                        ),
                      ),
                    );
                  },
                  child: TeacherCard(
                    teacher: listTeacher[index],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
