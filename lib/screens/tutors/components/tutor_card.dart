import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:lettutor_app/data/provider/teacher_provider.dart';
import 'package:easy_localization/easy_localization.dart';

class TutorCard extends StatelessWidget {
  const TutorCard({
    Key? key,
    required this.teacher,
  }) : super(key: key);

  final TeacherProvider teacher;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(12),
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
                              ],
                            ),
                            Row(
                              children: [
                                Text(teacher.getRating().toStringAsFixed(2)),
                                Icon(
                                  Icons.star_outlined,
                                  color: Colors.yellow[700],
                                  size: 16,
                                )
                              ],
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
                                    child: Text(
                                      teacher.convertSpecialties()[index],
                                      style: const TextStyle(
                                        color: mainColor,
                                      ),
                                    ).tr(),
                                    decoration: BoxDecoration(
                                      color: Colors.blue[100],
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
