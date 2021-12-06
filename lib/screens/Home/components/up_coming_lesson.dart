import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';

class UpComingLesson extends StatelessWidget {
  const UpComingLesson({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Text(
            "Total lesson time is 11 hours 46 minutes",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Upcoming Lesson",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Wed, 06 Oct 21 06:30 - 06:56",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            child: const Text(
              "Enter lesson room",
              style: TextStyle(fontSize: 14),
            ),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: mainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              padding: const EdgeInsets.all(10),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
      color: secondColor,
    );
  }
}
