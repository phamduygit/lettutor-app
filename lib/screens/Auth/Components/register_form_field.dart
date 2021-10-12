import 'package:flutter/material.dart';

import 'default_button.dart';
import 'normal_form_field.dart';
import 'secure_text_field.dart';

class RegisterFormField extends StatefulWidget {
  const RegisterFormField({ Key? key }) : super(key: key);

  @override
  _RegisterFormFieldState createState() => _RegisterFormFieldState();
}

class _RegisterFormFieldState extends State<RegisterFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const NormalFormField(titleTextFiled: "EMAIL", placeHolder: "Enter your email"),
        const SizedBox(height: 15),
        const SecureTextField(titleTextFiled: "PASSWORD", placeHolder: "Enter your password",),
        const SizedBox(height: 15),
        const SecureTextField(titleTextFiled: "CONFIRM", placeHolder: "Re-enter your password",),
        const SizedBox(height: 10),
        DefaultButton(
          content: 'LOG IN',
          press: () {},
        ),
      ],
    );
  }
}