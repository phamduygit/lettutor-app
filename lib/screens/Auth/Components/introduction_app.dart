import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';

class IntroductionApp extends StatelessWidget {
  const IntroductionApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/loginImage.png"),
        const SizedBox(height: 25),
        const Text(
          "Say hello your English tutors",
          style: TextStyle(
            color: mainColor,
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center,
        ).tr(),
        const Text(
          "Become fluent faster through one on one video chat lessons tailored to your goals.",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ).tr(),
      ],
    );
  }
}
