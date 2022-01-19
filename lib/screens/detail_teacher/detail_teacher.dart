import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:lettutor_app/data/api/tutor_api.dart';
import 'package:lettutor_app/data/provider/teacher_provider.dart';
import 'package:lettutor_app/data/provider/tutors_provider.dart';
import 'package:lettutor_app/models/teacher_info.dart';
import 'package:lettutor_app/screens/detail_teacher/components/video_intro.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'components/courses.dart';
import 'components/option_button.dart';
import 'components/over_view_teacher.dart';
import 'components/reviews.dart';
import 'components/title_and_chips.dart';
import 'components/title_and_paragraph.dart';
import 'package:easy_localization/easy_localization.dart';

class DetailTeacher extends StatefulWidget {
  const DetailTeacher({Key? key, required this.teacher}) : super(key: key);
  final TeacherProvider teacher;

  @override
  State<DetailTeacher> createState() => _DetailTeacherState();
}

class _DetailTeacherState extends State<DetailTeacher> {
  bool isFavorite = false;
  Future<TeacherInfo> getTeacherInfo() async {
    // print("teacherid: $teacherId");
    final value = await TutorAPI().getTutorInfoById(widget.teacher.userId);
    TeacherInfo teacherInfo = TeacherInfo.fromJson(value);
    isFavorite = teacherInfo.isFavorite;
    // print(teacherInfo.bio);
    return teacherInfo;
  }

  Future addToFavorite() async {
    setState(() {
      isFavorite = !isFavorite;
    });
    Provider.of<TutorsProvider>(context, listen: false)
        .addFavorite(widget.teacher);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TeacherInfo>(
      future: getTeacherInfo(),
      builder: (context, AsyncSnapshot<TeacherInfo> snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Detail Teacher").tr(),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: VideoIntro(
                        linkVideo: snapshot.data!.video,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OverViewTeacher(
                            teacher: snapshot.data!,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              OptionButton(
                                icon: Icons.chat_outlined,
                                title: tr("Message"),
                                press: () {},
                              ),
                              OptionButton(
                                icon: snapshot.data!.isFavorite
                                    ? CupertinoIcons.heart_fill
                                    : CupertinoIcons.heart,
                                title: tr("Favorite"),
                                press: () async {
                                  await addToFavorite();
                                },
                              ),
                              OptionButton(
                                icon: Icons.report_gmailerrorred_rounded,
                                title: tr("Report"),
                                press: () {},
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          // BookingButton(
                          //   today: DateTime.now(),
                          //   teacher: snapshot.data,
                          // ),
                          const SizedBox(height: 10),
                          ReadMoreText(
                            snapshot.data!.bio,
                            trimLines: 5,
                            style: const TextStyle(fontSize: 16),
                            colorClickableText: Colors.black,
                            trimMode: TrimMode.Line,
                            delimiter: ' ',
                            moreStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            lessStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          TitileAndChips(
                            title: tr("Languages"),
                            chipsContent: snapshot.data!.languages.split(","),
                          ),
                          TitleAndParagraph(
                            title: tr("Interests"),
                            paragraph: snapshot.data!.interests,
                          ),
                          TitleAndParagraph(
                            title: tr("Teaching experience"),
                            paragraph: snapshot.data!.interests,
                          ),
                          TitileAndChips(
                            title: ("Specialties"),
                            chipsContent: snapshot.data!.specialties.split(","),
                          ),
                          Courses(
                            courses: snapshot.data!.User?.courses ?? [],
                          ),
                          Reviews(
                            reviews: snapshot.data!.User!.feedbacks!,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
