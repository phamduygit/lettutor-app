import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:lettutor_app/data/api/tutor_api.dart';
import 'package:lettutor_app/data/provider/tutors_provider.dart';
import 'package:lettutor_app/screens/detail_teacher/detail_teacher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'components/tutor_card.dart';

class Tutors extends StatefulWidget {
  const Tutors({Key? key}) : super(key: key);

  @override
  State<Tutors> createState() => _TutorsState();
}

class _TutorsState extends State<Tutors> {
  late TextEditingController _textController;
  TutorsProvider filterTutor = TutorsProvider();
  List<String> selectedSpecifier = [];
  int lastPerPage = 3;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  void select(String specialty) {
    if (specialty == "All") {
      selectedSpecifier = [];
      return;
    }
    if (selectedSpecifier.contains(specialty)) {
      setState(() {
        selectedSpecifier.remove(specialty);
      });
    } else {
      setState(() {
        selectedSpecifier.add(specialty);
      });
    }
  }

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
    search();
    _refreshController.loadComplete();
  }

  Future<void> search() async {
    final value =
        await TutorAPI().searchTutor(lastPerPage, 1, selectedSpecifier, _textController.text);
    setState(() {
      filterTutor = TutorsProvider.fromJson(value);
    });
  }

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: '');
    search();
  }

  @override
  Widget build(BuildContext context) {
    List<String> specifiers = [
      "All",
      "english-for-kids",
      "business-english",
      "conversational-english",
      "starters",
      "movers",
      "flyers",
      "ket",
      "pet",
      "ielts",
      "toefl",
      "toeic",
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tutors",
          style: TextStyle(fontWeight: FontWeight.w500),
        ).tr(),
      ),
      body: SmartRefresher(
        enablePullDown: false,
        enablePullUp: true,
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CupertinoSearchTextField(
                  controller: _textController,
                  prefixInsets:
                      const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  onChanged: (value) {
                    search();
                  },
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      specifiers.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                select(specifiers[index]);
                                search();
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Text(
                                specifiers[index],
                                style: TextStyle(
                                  color: selectedSpecifier.contains(specifiers[index])
                                      ? mainColor
                                      : null,
                                ),
                              ).tr(),
                              decoration: BoxDecoration(
                                color: selectedSpecifier.contains(specifiers[index])
                                    ? Colors.blue[100]
                                    : Colors.grey.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: List.generate(
                    filterTutor.rows?.length ?? 0,
                    (index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailTeacher(
                                  teacherId: filterTutor.rows![index].userId)),
                        );
                      },
                      child: TutorCard(
                        teacher: filterTutor.rows![index],
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
