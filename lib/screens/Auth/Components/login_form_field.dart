import 'package:flutter/material.dart';
import 'package:lettutor_app/screens/Auth/Components/email_form_field.dart';
import 'package:lettutor_app/screens/Auth/forgot_password.dart';
import 'default_button.dart';
import 'secure_text_field.dart';

class MyFormField extends StatefulWidget {
  const MyFormField({Key? key}) : super(key: key);

  @override
  _MyFormFieldState createState() => _MyFormFieldState();
}

class _MyFormFieldState extends State<MyFormField> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const NormalFormField(
              titleTextFiled: "EMAIL", placeHolder: "Enter your email"),
          const SizedBox(height: 15),
          SecureTextField(
              titleTextFiled: "PASSWORD", placeHolder: "Enter your password", password: password,),
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
