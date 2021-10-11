import 'package:flutter/material.dart';
import 'package:lettutor_app/contants.dart';
import 'package:lettutor_app/screens/Auth/Components/form_field.dart';

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
                      fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  "Become fluent faster through one on one video chat lessons tailored to your goals.",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                const MyFormField(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


