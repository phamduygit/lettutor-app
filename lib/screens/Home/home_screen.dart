import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_app/data/api/tutor_api.dart';
import 'package:lettutor_app/data/provider/tutors_provider.dart';
import 'package:lettutor_app/data/provider/user_provider.dart';
import 'package:lettutor_app/screens/Home/components/teacher_card.dart';
import 'package:lettutor_app/screens/detail_teacher/detail_teacher.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'components/end_drawer.dart';
import 'components/recommended_tutors.dart';
import 'components/up_coming_lesson.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int lastPerPage = 3;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    lastPerPage += 3;
    // if (mounted) setState(() {});
    initListTutor();
    _refreshController.loadComplete();
  }

  Future<void> initListTutor() async {
    TutorAPI()
        .getListTutorWithPagination(
            lastPerPage, 1, "I would like to have free talk session")
        .then((value) {
      TutorsProvider tutorsProvider = TutorsProvider.fromJson(value["tutors"]);
      Provider.of<TutorsProvider>(context, listen: false)
          .setTutorsProvider(tutorsProvider);
    });
  }

  @override
  void initState() {
    super.initState();
    initListTutor();
  }

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
      body: SmartRefresher(
        enablePullDown: false,
        enablePullUp: true,
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const UpComingLesson(),
              const SizedBox(height: 5),
              const RecommendedTutors(),
              const SizedBox(height: 5),
              Column(
                children: List.generate(
                  tutors.rows?.length ?? 0,
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
      ),
    );
  }
}
