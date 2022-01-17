import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_app/data/provider/tutors_provider.dart';
import 'package:lettutor_app/data/provider/user_provider.dart';
import 'package:lettutor_app/screens/Home/components/teacher_card.dart';
import 'package:lettutor_app/screens/detail_teacher/detail_teacher.dart';
import 'package:provider/provider.dart';
import 'components/end_drawer.dart';
import 'components/recommended_tutors.dart';
import 'components/up_coming_lesson.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>();
    final tutors = context.watch<TutorsProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.w500),
        ).tr(),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: CircleAvatar(
                backgroundImage: NetworkImage(user.avatar),
              ),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      endDrawer: const EndDrawer(),
      // backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const UpComingLesson(),
            const SizedBox(height: 5),
            const RecommendedTutors(),
            const SizedBox(height: 5),
            Column(
              children: List.generate(
                tutors.count,
                (index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailTeacher(
                                teacherId: tutors.rows![index].userId,
                              ),
                          settings:
                              const RouteSettings(name: "/detailTeacher")),
                    );
                  },
                  child: TeacherCard(
                    teacher: tutors.rows![index],
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
