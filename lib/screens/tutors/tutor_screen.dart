import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:lettutor_app/data/api/tutor_api.dart';
import 'package:lettutor_app/data/provider/tutors_provider.dart';
import 'package:lettutor_app/screens/detail_teacher/detail_teacher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lettutor_app/util/fuctions.dart';
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
  TutorsProvider tutors = TutorsProvider();
  List<String> selectedSpecifier = [];
  int lastPerPage = 0;
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
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    lastPerPage += 3;
    if (lastPerPage > filterTutor.rows!.length) {
      setState(() {
        lastPerPage = filterTutor.rows!.length;
      });
    }
    _refreshController.loadComplete();
  }

  Future<void> search() async {
    setState(() {
      filterTutor.rows = tutors.rows!
          .where((element) =>
              checkStringContains(element.name, _textController.text) ||
              checkStringContains(element.country, _textController.text))
          .toList();
      filterTutor.rows = filterTutor.rows!
          .where((element) =>
              checkContains(selectedSpecifier, element.convertSpecialties()))
          .toList();
      lastPerPage = 3;
      if (lastPerPage > filterTutor.rows!.length) {
        lastPerPage = filterTutor.rows!.length;
      }
    });
  }

  Future<void> fetchData() async {
    final value = await TutorAPI().searchTutor(20, 1, [], "");
    if (!mounted) return;
    setState(() {
      tutors = TutorsProvider.fromJson(value);
      tutors.rows!.sort((a, b) => b.getRating().compareTo(a.getRating()));
      filterTutor.rows = tutors.rows;
      lastPerPage = 3;
    });
  }

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: '');
    fetchData();
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
      "toeic"
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
                                  color: selectedSpecifier
                                          .contains(specifiers[index])
                                      ? mainColor
                                      : null,
                                ),
                              ).tr(),
                              decoration: BoxDecoration(
                                color: selectedSpecifier
                                        .contains(specifiers[index])
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
                lastPerPage != 0
                    ? Column(
                        children: List.generate(
                          lastPerPage,
                          (index) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailTeacher(
                                        teacher: filterTutor.rows![index])),
                              );
                            },
                            child: TutorCard(
                              teacher: filterTutor.rows![index],
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(
                        width: 200,
                        height: 500,
                        child: Center(child: Icon(Icons.find_replace_outlined, size: 50,)),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
