import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:lettutor_app/data/api/user_api.dart';
import 'package:lettutor_app/data/provider/user_provider.dart';
import 'package:lettutor_app/screens/profile/components/edit_photo.dart';
import 'package:lettutor_app/util/fuctions.dart';
import 'package:provider/provider.dart';
import 'birthday_text_form_field.dart';
import 'country_text_form_field.dart';
import 'courses_text_form_field.dart';
import 'email_text_form_field.dart';
import 'level_text_form_field.dart';
import 'normal_text_form_filed.dart';
import 'phone_text_form_field.dart';
import 'update_button.dart';
import 'package:easy_localization/easy_localization.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>();
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
                user.name == "" ? "None" : user.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text("${tr("Account ID")}: ${user.id}"),
              const Divider(),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    NormalTextFormField(
                      name: user.name,
                      hintText: tr("Enter your name"),
                      title: tr("Name"),
                    ),
                    const SizedBox(height: 10),
                    const EmailTextFormField(),
                    const SizedBox(height: 10),
                    CountryTextFormField(title: tr("Country")),
                    const SizedBox(height: 10),
                    const PhoneTextFormField(),
                    const SizedBox(height: 10),
                    BirthdayTextFormField(
                      title: tr("Birthday"),
                    ),
                    const SizedBox(height: 10),
                    LevelTextFormField(
                      title: tr("My level"),
                    ),
                    const SizedBox(height: 10),
                    CoursesTextFormField(
                      title: tr("Want to learn"),
                      hintText: tr("Chose the courses you want to learn"),
                    ),
                    const SizedBox(height: 20),
                    UpdateButton(
                      press: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          final data = {
                            "name": user.name,
                            "country": user.country,
                            "phone": user.phone,
                            "birthday":
                                DateFormat('yyyy-MM-dd').format(user.birthday!),
                            "level": user.level,
                            "learnTopics": getIDTopic(user.learnTopics!),
                            "testPreparations":
                                getIDTopic(user.testPreparations!)
                          };
                          UserAPI().updateUserInformation((data)).then((value) {
                            UserProvider newUser =
                                UserProvider.fromJson(value["user"]);
                            Provider.of<UserProvider>(context, listen: false)
                                .updateUser(newUser);
                          });

                          // Navigator.pop(context);
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
