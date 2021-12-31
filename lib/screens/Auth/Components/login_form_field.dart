import 'package:flutter/material.dart';
import 'package:lettutor_app/data/provider/local_app_sp.dart';
import 'package:lettutor_app/data/provider/user_provider.dart';
import 'package:lettutor_app/screens/Auth/forgot_password.dart';
import 'package:lettutor_app/screens/auth/components/email_form_field.dart';
import 'package:lettutor_app/screens/auth/components/secure_text_field.dart';
import 'package:lettutor_app/data/sql_lite/user_dao.dart';
import 'package:lettutor_app/services/email_password.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'default_button.dart';
import 'package:easy_localization/easy_localization.dart';

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
                child: Text(
                    "Forget Password? ${context.watch<LocalApp>().getCurrentUserID}",).tr(),
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
                signInWithEmailPassword(_email, _password);
                // if (_password == "12345678") {
                //   UserProvider newUser = UserProvider(
                //     id: const Uuid().v4(),
                //     email: _email,
                //     favorites: [],
                //     target: [],
                //     birthDay: DateTime.now(),
                //   );
                //   if (await UserDAO().isNotExists(newUser)) {
                //     await UserDAO().insert(newUser);
                //   } else {
                //     newUser = await UserDAO().getUserByEmail(_email);
                //   }
                //   SharedPreferences prefs =
                //       await SharedPreferences.getInstance();
                //   await prefs.setString('currentUserID', newUser.id);
                //   Provider.of<LocalApp>(context, listen: false)
                //       .setID(newUser.id);
                // } else {
                //   ///
                // }
              }
            },
          ),
        ],
      ),
    );
  }
}
