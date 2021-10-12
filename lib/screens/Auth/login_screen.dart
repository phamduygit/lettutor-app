import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lettutor_app/contants.dart';
import 'package:lettutor_app/screens/Auth/Components/form_field.dart';

import 'Components/border_icon_button.dart';

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
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/loginImage.png"),
                const Text(
                  "Say hello your English tutors",
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  "Become fluent faster through one on one video chat lessons tailored to your goals.",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                const MyFormField(),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have account? "),
                    InkWell(
                      child: const Text(
                        "Sign up",
                        style: TextStyle(color: mainColor),
                      ),
                      onTap: () {},
                    )
                  ],
                ),
                const SizedBox(height: 15),
                const Text("Or continue wiith"),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    BorderIconButton(iconName: "assets/images/icons8-google.svg"),
                    SizedBox(width: 20,),
                    BorderIconButton(iconName: "assets/images/icons8-facebook.svg"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
