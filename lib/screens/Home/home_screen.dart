import 'package:flutter/material.dart';

import 'package:lettutor_app/screens/detail_teacher/detail_teacher.dart';
import 'package:lettutor_app/data/provider/list_teacher.dart';
import 'package:provider/provider.dart';
import 'components/end_drawer.dart';
import 'components/recommended_tutors.dart';
import 'components/teacher_card.dart';
import 'components/up_coming_lesson.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    var teachers = context.watch<ListTeacher>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon:  const CircleAvatar(
                backgroundImage: NetworkImage("https://images.unsplash.com/photo-1565604113656-e92be3ec1b15?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
              ),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      endDrawer: const EndDrawer(),
      // backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const UpComingLesson(),
            const SizedBox(height: 5),
            const RecommendedTutors(),
            const SizedBox(height: 5),
            Column(
              children: List.generate(
                teachers.list.length,
                (index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailTeacher(
                          teacher: teachers.list[index],
                        ),
                        settings: const RouteSettings(name: "/detailTeacher")
                      ),
                    );
                  },
                  child: TeacherCard(
                    teacher: teachers.list[index],
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
