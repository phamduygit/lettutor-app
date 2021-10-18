import 'package:flutter/material.dart';
import 'package:lettutor_app/contants.dart';
import 'package:lettutor_app/screens/profile/components/edit_photo.dart';
import 'birthday_text_form_field.dart';
import 'country_text_form_field.dart';
import 'courses_text_form_field.dart';
import 'email_text_form_field.dart';
import 'level_text_form_field.dart';
import 'normal_text_form_filed.dart';
import 'phone_text_form_field.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  // CountryCode countryCode;
  @override
  Widget build(BuildContext context) {
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
              const Text(
                "Phạm Minh Duy",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text("Account ID: 2b1195b1-3714-48da-8f65-f3e757112ef7"),
              const Divider(),
              const NormalTextFormField(name: "Phạm Minh Duy"),
              const SizedBox(height: 10),
              const EmailTextFormField(),
              const SizedBox(height: 10),
              const CountryTextFormField(),
              const SizedBox(height: 10),
              const PhoneTextFormField(),
              const SizedBox(height: 10),
              const BirthdayTextFormField(),
              const SizedBox(height: 10),
              const LevelTextFormField(),
              const SizedBox(height: 10),
              const CoursesTextFormField(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  primary: mainColor,
                ),
                child: Row(
                  children: const [
                    Spacer(),
                    Text(
                      "Update",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
