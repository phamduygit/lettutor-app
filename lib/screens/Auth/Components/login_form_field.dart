import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lettutor_app/data/provider/local_app_sp.dart';
import 'package:lettutor_app/data/share_preference/local_sp.dart';
import 'package:lettutor_app/screens/Auth/forgot_password.dart';
import 'package:lettutor_app/screens/auth/components/email_form_field.dart';
import 'package:lettutor_app/screens/auth/components/secure_text_field.dart';
import 'package:provider/provider.dart';
import 'default_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;

class MyFormField extends StatefulWidget {
  const MyFormField({Key? key}) : super(key: key);

  @override
  _MyFormFieldState createState() => _MyFormFieldState();
}

class _MyFormFieldState extends State<MyFormField> {
  final _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  final TextEditingController password = TextEditingController();
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
          EmailTextField(saveEmail: saveEmail),
          const SizedBox(height: 15),
          PasswordTextField(savePassword: savePassword),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: const Text(
                  "Forget Password?",
                ).tr(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const ForgotPasswordScreen();
                      },
                    ),
                  );
                },
              )
            ],
          ),
          const SizedBox(height: 10),
          DefaultButton(
            content: tr('LOG IN'),
            press: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // signInWithEmailPassword(_email, _password);

                var url =
                    Uri.parse('https://sandbox.api.lettutor.com/auth/login');
                var response = await http
                    .post(url, body: {"email": _email, "password": _password});
                if (response.statusCode == 200) {
                  // LocalSP().setAccessToken(value)
                  Map<String, dynamic> json = jsonDecode(response.body);
                  String token = json["tokens"]["access"]["token"];
                  LocalSP().setAccessToken(token);
                  Provider.of<LocalApp>(context, listen: false).setAccessToken(token);
                } else {
                  Map<String, dynamic> json = jsonDecode(response.body);
                  debugPrint(json["message"]);
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
