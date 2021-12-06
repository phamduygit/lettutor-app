// ignore_for_file: implementation_imports

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:lettutor_app/models/teacher.dart';
import 'package:lettutor_app/models/user.dart';
import 'package:provider/src/provider.dart';


class TeacherCard extends StatelessWidget {
  const TeacherCard({
    Key? key,
    required this.teacher,
  }) : super(key: key);
  final Teacher teacher;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(5),
        ),
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
                                      Icons.star,
                                      color: index < teacher.rating - 1
                                          ? Colors.yellow[700]
                                          : Colors.transparent,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              context.read<User>().like(teacher.id);
                            },
                            child: Icon(
                              context.watch<User>().isFavorite(teacher.id) ? Icons.favorite : Icons.favorite_border,
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
                            teacher.specialties.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Center(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  child: Text(teacher.specialties[index],
                                      style: const TextStyle(color: mainColor)),
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
              teacher.description,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
