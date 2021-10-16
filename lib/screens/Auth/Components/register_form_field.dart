import 'package:flutter/material.dart';
import 'package:lettutor_app/screens/auth/components/re_enter_password_form_field.dart';

import 'default_button.dart';
import 'email_form_field.dart';
import 'secure_text_field.dart';

class RegisterFormField extends StatefulWidget {
  const RegisterFormField({ Key? key }) : super(key: key);

  @override
  _RegisterFormFieldState createState() => _RegisterFormFieldState();
}

class _RegisterFormFieldState extends State<RegisterFormField> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const NormalFormField(titleTextFiled: "EMAIL", placeHolder: "Enter your email"),
          const SizedBox(height: 15),
          SecureTextField(titleTextFiled: "PASSWORD", placeHolder: "Enter your password", password: password),
          const SizedBox(height: 15),
          ReEnterPasswordFormField(titleTextFiled: "CONFIRM", placeHolder: "Re-enter your password", password: password, confirmPassword: confirmPassword),
          const SizedBox(height: 20),
          DefaultButton(
            content: 'LOG IN',
            press: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
          ),
        ],
      ),
    );
  }
}