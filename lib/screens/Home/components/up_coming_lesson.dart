import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';

class UpComingLesson extends StatelessWidget {
  const UpComingLesson({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Text(
            "${tr("Total lesson time is")} ${DateFormat('hh').format(DateTime.now())} ${tr("hours")} ${DateFormat('mm').format(DateTime.now())} ${tr("minutes")}",
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const Text(
            "Upcoming Lesson",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ).tr(),
          const SizedBox(height: 10),
          Text(
            DateFormat('EE, dd MMM yy hh:mm - hh:mm', context.fallbackLocale.toString() == "vi_VN" ? "vi" : "en" ).format(DateTime.now()),
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            child: const Text(
              "Enter lesson room",
              style: TextStyle(fontSize: 14),
            ).tr(),
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
