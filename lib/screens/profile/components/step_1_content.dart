import 'package:flutter/material.dart';
import 'package:lettutor_app/screens/profile/components/birthday_text_form_field.dart';
import 'package:lettutor_app/screens/profile/components/country_text_form_field.dart';
import 'package:lettutor_app/screens/profile/components/language_text_form_field.dart';
import 'package:lettutor_app/screens/profile/components/level_text_form_field.dart';
import 'package:lettutor_app/screens/profile/components/normal_text_form_filed.dart';
import 'package:lettutor_app/screens/profile/components/title_line.dart';

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
        const TitleLine(title: "Basic info"),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Spacer(),
            EditPhoto(),
            Spacer(),
          ],
        ),
        const NormalTextFormField(
          name: "Phạm Minh Duy",
          title: "Tutoring name",
          hintText: "Enter your name",
        ),
        const CountryTextFormField(
          title: "I'm from",
        ),
        const BirthdayTextFormField(
          title: "Date of birth",
        ),
        const SizedBox(height: 10),
        const TitleLine(title: "CV"),
        const SizedBox(height: 10),
        const Text(
            "Students will view this information on your profile to decide if you're a good fit for them."),
        const SizedBox(height: 10),
        const NormalTextFormField(
            hintText: "Enter your interests",
            title: "Interests",
            name: ""),
        const SizedBox(height: 10),
        const NormalTextFormField(
            hintText: "Enter your education",
            title: "Education",
            name: ""),
        const SizedBox(height: 10),
        const NormalTextFormField(
            hintText: "Enter your experience",
            title: "Experience",
            name: ""),
        const SizedBox(height: 10),
        const NormalTextFormField(
          hintText: "Enter your profession",
          title: "Current or Previous Profession",
          name: "",
        ),
        const SizedBox(height: 10),
        const TitleLine(title: "Languages I speak"),
        const SizedBox(height: 10),
        const LanguageTextFormField(),
        const SizedBox(height: 10),
        const TitleLine(title: "Who I teach"),
        const SizedBox(height: 10),
        const Text(
            "This is the first thing students will see when looking for tutors."),
        const SizedBox(height: 10),
        const NormalTextFormField(
          hintText: "Enter your introduction",
          title: "Introduction",
          name: "",
        ),
        const SizedBox(height: 10),
        const LevelTextFormField(),
        const SizedBox(height: 10),
        const CoursesTextFormField(title: "My specialties are", hintText: "Chose your specialties",)
      ],
    );
  }
}

