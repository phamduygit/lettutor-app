import 'package:flutter/material.dart';
import 'package:lettutor_app/contants.dart';
import 'package:lettutor_app/screens/Auth/Components/default_button.dart';
import 'package:lettutor_app/screens/Auth/Components/introduction_app.dart';
import 'package:lettutor_app/screens/Auth/Components/normal_form_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Forgot password"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              const IntroductionApp(),
              const SizedBox(height: 15),
              const NormalFormField(titleTextFiled: "EMAIL", placeHolder: "Enter your email"),
              const SizedBox(height: 15),
              DefaultButton(content: "SEND", press: () {})
            ],
          ),
        ),
      ),
    );
  }
}
