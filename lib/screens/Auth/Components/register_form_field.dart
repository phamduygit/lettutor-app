import 'package:flutter/material.dart';
import 'package:lettutor_app/data/api/auth_api.dart';
import 'package:lettutor_app/screens/auth/components/email_form_field.dart';
import 'package:lettutor_app/screens/auth/components/re_enter_password_form_field.dart';
import 'package:lettutor_app/screens/auth/components/secure_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
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
            press: () async {
              _formKey.currentState!.save();
              if (_formKey.currentState!.validate()) {
                String title = "", message = "";
                final data = await AuthAPI().registerAccount(_email, _password);
                title = data["status"] == 201 ? "Account is created" : "Failure";
                message = data["message"];
                _showMyDialog(title: title, message: message);
              }
            },
          ),
        ],
      ),
    );
  }

  Future<void> _showMyDialog(
      {required String title, required String message}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
