import 'package:flutter/material.dart';
import 'package:lettutor_app/screens/Auth/forgot_password.dart';
import 'package:lettutor_app/screens/auth/components/email_form_field.dart';
import 'package:lettutor_app/screens/auth/components/secure_text_field.dart';
import 'package:lettutor_app/screens/my_tab_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'default_button.dart';

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
  _didLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = 1;
    await prefs.setInt('isLogin', counter);
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
                child: const Text("Forget Password?"),
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
            content: 'LOG IN',
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Processing Data $_email $_password')),
                );
                if (_email == "admin@gmail.com" && _password == "123456789") {
                  _didLogin();
                  // Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MyTabBar()));
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
