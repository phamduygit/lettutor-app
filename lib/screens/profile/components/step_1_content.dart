import 'package:flutter/material.dart';
import 'package:lettutor_app/screens/profile/components/birthday_text_form_field.dart';
import 'package:lettutor_app/screens/profile/components/country_text_form_field.dart';
import 'package:lettutor_app/screens/profile/components/language_text_form_field.dart';
import 'package:lettutor_app/screens/profile/components/level_text_form_field.dart';
import 'package:lettutor_app/screens/profile/components/normal_text_form_filed.dart';
import 'package:lettutor_app/screens/profile/components/title_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'courses_text_form_field.dart';
import 'edit_photo.dart';

class StepOneContent extends StatelessWidget {
  const StepOneContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleLine(title: tr("Basic info")),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Spacer(),
            EditPhoto(),
            Spacer(),
          ],
        ),
        const SizedBox(height: 10),
        NormalTextFormField(
          name: "Phạm Minh Duy",
          title: tr("Tutoring name"),
          hintText: tr("Enter your name"),
        ),
        const SizedBox(height: 10),
        CountryTextFormField(
          title: tr("I'm from"),
        ),
        const SizedBox(height: 10),
        BirthdayTextFormField(
          title: tr("Date of birth"),
        ),
        const SizedBox(height: 10),
        const TitleLine(title: "CV"),
        const SizedBox(height: 10),
        const Text(
                "Students will view this information on your profile to decide if you're a good fit for them.")
            .tr(),
        const SizedBox(height: 10),
        NormalTextFormField(
            hintText: tr("Enter your interests"),
            title: tr("Interests"),
            name: ""),
        const SizedBox(height: 10),
        NormalTextFormField(
            hintText: tr("Enter your education"),
            title: tr("Education"),
            name: ""),
        const SizedBox(height: 10),
        NormalTextFormField(
            hintText: tr("Enter your experience"),
            title: tr("Experience"),
            name: ""),
        const SizedBox(height: 10),
        NormalTextFormField(
          hintText: tr("Enter your profession"),
          title: tr("Current or Previous Profession"),
          name: "",
        ),
        const SizedBox(height: 10),
        TitleLine(title: tr("Languages I speak")),
        const SizedBox(height: 10),
        LanguageTextFormField(
          title: tr("Languages"),
        ),
        const SizedBox(height: 10),
        TitleLine(title: tr("Who I teach")),
        const SizedBox(height: 10),
        const Text(
                "This is the first thing students will see when looking for tutors.")
            .tr(),
        const SizedBox(height: 10),
        NormalTextFormField(
          hintText: tr("Enter your introduction"),
          title: tr("Introduction"),
          name: "",
        ),
        const SizedBox(height: 10),
        LevelTextFormField(
          title: tr("I am best at teaching students who are"),
        ),
        const SizedBox(height: 10),
        CoursesTextFormField(
          title: tr("My specialties are"),
          hintText: tr("Chose your specialties"),
        )
      ],
    );
  }
}
