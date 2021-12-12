import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:lettutor_app/models/user.dart';
import 'package:lettutor_app/screens/profile/components/edit_photo.dart';
import 'package:provider/provider.dart';
import 'birthday_text_form_field.dart';
import 'country_text_form_field.dart';
import 'courses_text_form_field.dart';
import 'email_text_form_field.dart';
import 'level_text_form_field.dart';
import 'normal_text_form_filed.dart';
import 'phone_text_form_field.dart';
import 'update_button.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final user = context.watch<User>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Spacer(),
                  EditPhoto(),
                  Spacer(),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                user.fullName == "" ? "None" : user.fullName,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text("Account ID: ${user.id}"),
              const Divider(),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    NormalTextFormField(
                      name: user.fullName,
                      hintText: "Enter your name",
                      title: "Name",
                    ),
                    const SizedBox(height: 10),
                    const EmailTextFormField(),
                    const SizedBox(height: 10),
                    const CountryTextFormField(title: "Country"),
                    const SizedBox(height: 10),
                    const PhoneTextFormField(),
                    const SizedBox(height: 10),
                    const BirthdayTextFormField(
                      title: "Birthday",
                    ),
                    const SizedBox(height: 10),
                    const LevelTextFormField(),
                    const SizedBox(height: 10),
                    const CoursesTextFormField(
                      title: "Want to learn",
                      hintText: "Chose the courses you want to learn",
                    ),
                    const SizedBox(height: 20),
                    UpdateButton(
                      press: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        }
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
