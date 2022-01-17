import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:lettutor_app/data/provider/teacher_provider.dart';
import 'package:lettutor_app/models/pattern.dart';
import 'package:easy_localization/easy_localization.dart';
import 'time_button.dart';

class DateButton extends StatelessWidget {
  const DateButton({
    Key? key,
    required this.date,
    required this.teacher,
  }) : super(key: key);
  final DateTime date;
  final TeacherProvider teacher;
  @override
  Widget build(BuildContext context) {
    var fliterTime = schedules.where((i) => (i.isAfter(DateTime.now()) && i.day == date.day)).toList();
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
        child: Row(
          children: [
            const Spacer(),
            Text(
              DateFormat('yyyy-MM-dd').format(date),
              style: const TextStyle(fontSize: 18),
            ),
            const Spacer(),
          ],
        ),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(defaultPadding),
                      child: const Text(
                        "Select your time!",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ).tr(),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding),
                        child: GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: 3,
                          children: List.generate(
                            fliterTime.length,
                            (index) => TimeButton(
                              date: fliterTime[index],
                              teacher: teacher,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            barrierColor: Colors.transparent,
          );
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(defaultPadding),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
