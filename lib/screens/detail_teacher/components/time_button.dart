import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:lettutor_app/models/teacher.dart';
import 'package:lettutor_app/screens/detail_teacher/components/booking_detail_screen.dart';

class TimeButton extends StatelessWidget {
  const TimeButton({
    Key? key,
    required this.date,
    required this.teacher,
  }) : super(key: key);

  final DateTime date;
  final Teacher teacher;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookingDetailScreen(
                date: date,
                teacher: teacher,
              ),
            ),
          );
        },
        child: Text(
          "${DateFormat('HH:mm').format(date)} - ${DateFormat('HH:mm').format(date)}",
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: mainColor, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
