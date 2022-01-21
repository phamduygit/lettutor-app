import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:lettutor_app/data/provider/teacher_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lettutor_app/data/provider/tutors_provider.dart';
import 'package:provider/provider.dart';

class TeacherCard extends StatelessWidget {
  const TeacherCard({
    Key? key,
    required this.teacher,
  }) : super(key: key);
  final TeacherProvider teacher;
  @override
 
  Widget build(BuildContext context) {
     final tutors = context.watch<TutorsProvider>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Card(
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(teacher.avatar),
                    radius: 30,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  teacher.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: List.generate(
                                    5,
                                    (index) => Container(
                                      padding: const EdgeInsets.only(right: 4),
                                      child: Icon(
                                        index < teacher.getRating() - 0.5
                                            ? Icons.star
                                            : index - teacher.getRating() + 0.25 > 0
                                                ? Icons.star_border
                                                : Icons.star_half,
                                        color: Colors.yellow[700],
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {
                                tutors.addFavorite(teacher);
                              },
                              child: Icon(
                                teacher.isFavorite == 1
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 24,
                                color: Colors.red,
                              ),
                              style: TextButton.styleFrom(
                                  shape: const CircleBorder()),
                            )
                          ],
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 40,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                              teacher.convertSpecialties().length,
                              (index) => Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Center(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    child: Text(teacher.convertSpecialties()[index],
                                        style:
                                            const TextStyle(color: mainColor)).tr(),
                                    decoration: BoxDecoration(
                                      color: Colors.blue[200],
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text(
                teacher.bio,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
