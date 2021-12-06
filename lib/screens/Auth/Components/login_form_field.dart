import 'package:flutter/material.dart';
import 'package:lettutor_app/models/user.dart';
import 'package:lettutor_app/screens/Auth/forgot_password.dart';
import 'package:lettutor_app/screens/auth/components/email_form_field.dart';
import 'package:lettutor_app/screens/auth/components/secure_text_field.dart';
import 'package:lettutor_app/screens/my_tab_bar.dart';
import 'package:lettutor_app/service/provider/user_provider.dart';
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

  _didLogin(String userID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('currentUserID', userID);
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
            press: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                User newUser = User(
                  id: _email,
                  fullName: _email,
                  email: _email,
                  favorites: [],
                );
                if (await UserProvider().isNotExists(newUser)) {
                  await UserProvider().insert(newUser);
                } else {

                }
                _didLogin(newUser.id);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyTabBar()),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
