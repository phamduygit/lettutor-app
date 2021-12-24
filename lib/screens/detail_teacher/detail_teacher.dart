import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:lettutor_app/models/teacher.dart';
import 'package:lettutor_app/models/user.dart';
import 'package:lettutor_app/data/provider/list_teacher.dart';
import 'package:lettutor_app/data/sql_lite/favorite_dao.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:uuid/uuid.dart';
import 'components/booking_button.dart';
import 'components/courses.dart';
import 'components/option_button.dart';
import 'components/over_view_teacher.dart';
import 'components/reviews.dart';
import 'components/title_and_chips.dart';
import 'components/title_and_paragraph.dart';

class DetailTeacher extends StatelessWidget {
  const DetailTeacher({Key? key, required this.teacher}) : super(key: key);
  final Teacher teacher;
  @override
  Widget build(BuildContext context) {
    var heightScreen = MediaQuery.of(context).size.height;
    final user = context.watch<User>();
    final teacherProvider = context.watch<ListTeacher>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Teacher"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: heightScreen * 0.3,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OverViewTeacher(
                      teacher: teacher,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OptionButton(
                          icon: Icons.chat_outlined,
                          title: "Message",
                          press: () {},
                        ),
                        OptionButton(
                          icon: teacher.isFavorite == 1
                              ? CupertinoIcons.heart_fill
                              : CupertinoIcons.heart,
                          title: "Favorite",
                          press: () {
                            user.like(teacher.id);
                            teacherProvider.favorite(teacher);
                            // local save
                            if (user.isFavorite(teacher.id)) {
                              Favorite newFavorite = Favorite(
                                id: const Uuid().v4(),
                                userID: user.id,
                                teacherID: teacher.id,
                              );
                              FavoriteDAO().insert(newFavorite);
                            } else {
                              FavoriteDAO().delete(user.id, teacher.id);
                            }
                          },
                        ),
                        OptionButton(
                          icon: Icons.report_gmailerrorred_rounded,
                          title: "Report",
                          press: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    BookingButton(
                      today: DateTime.now(),
                      teacher: teacher,
                    ),
                    const SizedBox(height: 10),
                    ReadMoreText(
                      teacher.description,
                      trimLines: 5,
                      style: const TextStyle(fontSize: 16),
                      colorClickableText: Colors.black,
                      trimMode: TrimMode.Line,
                      delimiter: ' ',
                      moreStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      lessStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    TitileAndChips(
                      title: "Language",
                      chipsContent: teacher.language,
                    ),
                    TitleAndParagraph(
                      title: "Interest",
                      paragraph: teacher.interests,
                    ),
                    TitleAndParagraph(
                      title: "Teaching experience",
                      paragraph: teacher.interests,
                    ),
                    TitileAndChips(
                      title: "Specialties",
                      chipsContent: teacher.specialties,
                    ),
                    const Courses(),
                    Reviews(teacher: teacher),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
