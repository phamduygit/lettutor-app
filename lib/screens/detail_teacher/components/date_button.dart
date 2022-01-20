import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:lettutor_app/data/provider/schedule_data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lettutor_app/models/schedule.dart';
import 'package:lettutor_app/models/teacher_info.dart';
import 'package:provider/provider.dart';
import 'time_button.dart';

class DateButton extends StatelessWidget {
  const DateButton({
    Key? key,
    required this.date,
    required this.teacher,
  }) : super(key: key);
  final DateTime date;
  final TeacherInfo teacher;
  @override
  Widget build(BuildContext context) {
    DateTime newDate = DateTime(date.year, date.month, date.day);
    final scheduleData = context.read<ScheduleData>();
    final List<Schedule> scheduleInDay = scheduleData.getScheduleInDay(newDate);
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
        child: Row(
          children: [
            const Spacer(),
            Text(
              DateFormat('dd-MM-yyyy').format(newDate),
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
                            scheduleInDay.length,
                            (index) => TimeButton(
                              schedule: scheduleInDay[index],
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
