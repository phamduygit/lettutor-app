import 'package:flutter/material.dart';
import 'package:lettutor_app/screens/profile/components/birthday_text_form_field.dart';
import 'package:lettutor_app/screens/profile/components/country_text_form_field.dart';
import 'package:lettutor_app/screens/profile/components/level_text_form_field.dart';
import 'package:lettutor_app/screens/profile/components/normal_text_form_filed.dart';

import 'components/courses_text_form_field.dart';
import 'components/edit_photo.dart';

class BecomeTeacher extends StatefulWidget {
  const BecomeTeacher({Key? key}) : super(key: key);

  @override
  State<BecomeTeacher> createState() => _BecomeTeacherState();
}

class _BecomeTeacherState extends State<BecomeTeacher> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Become Tutor"),
      ),
      backgroundColor: Colors.white,
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _index,
        onStepCancel: () {
          if (_index > 0) {
            setState(() {
              _index -= 1;
            });
          }
        },
        onStepContinue: () {
          if (_index <= 1) {
            setState(() {
              _index += 1;
            });
          }
        },
        onStepTapped: (int index) {
          setState(() {
            _index = index;
          });
        },
        steps: <Step>[
          Step(
            isActive: _index == 0,
            title: const Text('Profile'),
            content: Column(
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
            ),
          ),
          Step(
            isActive: _index == 1,
            title: const Text('Video'),
            content: const Text('Content for Step 2'),
          ),
          Step(
            isActive: _index == 2,
            title: const Text('Approval'),
            content: const Text('Content for Step 3'),
          ),
        ],
      ),
    );
  }
}

class TitleLine extends StatelessWidget {
  const TitleLine({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 30,
          child: Divider(
            endIndent: 10,
          ),
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const Expanded(
          child: Divider(
            indent: 10,
          ),
        ),
      ],
    );
  }
}
