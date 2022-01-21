import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:lettutor_app/models/schedule.dart';
import 'package:lettutor_app/models/teacher_info.dart';
import 'package:lettutor_app/screens/detail_teacher/components/booking_detail_screen.dart';

class TimeButton extends StatelessWidget {
  const TimeButton({
    Key? key,
    required this.schedule,
    required this.teacher,
  }) : super(key: key);

  final Schedule schedule;
  final TeacherInfo teacher;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        onPressed: (schedule.isBooked || schedule.scheduleDetails![0].isBooked)
            ? null
            : () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingDetailScreen(
                      schedule: schedule,
                      teacher: teacher,
                    ),
                  ),
                );
              },
        child: Text(
          "${DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(schedule.startTimestamp))} - ${DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(schedule.endTimestamp))}",
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(
              color: !schedule.isBooked ? mainColor : Colors.grey, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
