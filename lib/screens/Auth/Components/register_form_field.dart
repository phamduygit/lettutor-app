import 'package:flutter/material.dart';
import 'package:lettutor_app/screens/auth/components/email_form_field.dart';
import 'package:lettutor_app/screens/auth/components/re_enter_password_form_field.dart';
import 'package:lettutor_app/screens/auth/components/secure_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lettutor_app/services/email_password.dart';
import 'default_button.dart';

class RegisterFormField extends StatefulWidget {
  const RegisterFormField({Key? key}) : super(key: key);

  @override
  _RegisterFormFieldState createState() => _RegisterFormFieldState();
}

class _RegisterFormFieldState extends State<RegisterFormField> {
  final _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";

  void saveEmail(value) {
    setState(() {
      _email = value;
    });
  }

  void savePassword(value) {
    setState(() {
      _password = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          EmailTextField(
            saveEmail: saveEmail,
          ),
          const SizedBox(height: 15),
          PasswordTextField(
            savePassword: savePassword,
          ),
          const SizedBox(height: 15),
          ReEnterPasswordTextField(
            password: _password,
          ),
          const SizedBox(height: 20),
          DefaultButton(
            content: tr('SIGN UP'),
            press: () {
              _formKey.currentState!.save();
              if (_formKey.currentState!.validate()) {
                registerWithEmailPassword(_email, _password);
              }
            },
          ),
        ],
      ),
    );
  }
}
