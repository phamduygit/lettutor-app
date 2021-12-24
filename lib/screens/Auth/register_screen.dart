import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:lettutor_app/screens/Auth/Components/introduction_app.dart';
import 'package:lettutor_app/screens/Auth/Components/login_fb_gg.dart';
import 'package:lettutor_app/screens/Auth/Components/register_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up"),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: SingleChildScrollView(
            child: Column(
              children: const [
                IntroductionApp(),
                SizedBox(height: 15),
                RegisterFormField(),
                SizedBox(height: 15),
                LoginFacebookGoogle(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
