import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:lettutor_app/screens/Auth/Components/login_form_field.dart';
import 'package:lettutor_app/screens/Auth/register_screen.dart';
import 'Components/introduction_app.dart';
import 'Components/login_fb_gg.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const IntroductionApp(),
                const SizedBox(height: 15),
                const MyFormField(),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have account? ").tr(),
                    InkWell(
                      child: Text(
                        tr("Sign up"),
                        style: const TextStyle(color: mainColor),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const RegisterScreen();
                          }),
                        );
                      },
                    )
                  ],
                ),
                const SizedBox(height: 15),
                const LoginFacebookGoogle(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
