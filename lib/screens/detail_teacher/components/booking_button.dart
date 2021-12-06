import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:lettutor_app/models/teacher.dart';

import 'date_button.dart';

class BookingButton extends StatelessWidget {
  const BookingButton({
    Key? key,
    required this.today,
    required this.teacher,
  }) : super(key: key);
  final DateTime today;
  final Teacher teacher;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Row(
        children: const [
          Spacer(),
          Text(
            "Booking",
            style: TextStyle(fontSize: 18),
          ),
          Spacer(),
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
                      "Select your date!",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            DateButton(
                              date: today,
                              teacher: teacher,
                            ),
                            DateButton(
                                date: today.add(const Duration(days: 1)),
                                teacher: teacher),
                            DateButton(
                                date: today.add(const Duration(days: 2)),
                                teacher: teacher),
                          ],
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
        );
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(defaultPadding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
