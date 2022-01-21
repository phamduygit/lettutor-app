import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:lettutor_app/data/api/auth_api.dart';
import 'package:lettutor_app/screens/Auth/Components/default_button.dart';
import 'package:lettutor_app/screens/auth/components/email_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = "";
  void saveEmail(value) {
    setState(() {
      _email = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot password").tr(),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Reset Password",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  "Please enter your email address to search for your account",
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                EmailTextField(saveEmail: saveEmail),
                const SizedBox(height: 15),
                DefaultButton(
                  content: tr("SEND"),
                  press: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      String message = await AuthAPI().forgotPassowrd(_email);
                      await _showMyDialog(title: "Message", message: message);
                    }
                  },
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
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
