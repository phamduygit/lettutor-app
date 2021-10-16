import 'package:flutter/material.dart';
import 'package:lettutor_app/screens/auth/components/email_form_field.dart';
import 'package:lettutor_app/screens/auth/components/re_enter_password_form_field.dart';
import 'package:lettutor_app/screens/auth/components/secure_text_field.dart';

import 'default_button.dart';

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
          const EmailTextField(),
          const SizedBox(height: 15),
          PasswordTextField(password: password),
          const SizedBox(height: 15),
          ReEnterPasswordTextField(password: password, confirmPassword: confirmPassword),
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