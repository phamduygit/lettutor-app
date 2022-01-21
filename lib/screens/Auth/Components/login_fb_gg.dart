import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lettutor_app/data/api/auth_api.dart';
import 'package:lettutor_app/data/provider/local_app_sp.dart';
import 'package:lettutor_app/data/share_preference/local_sp.dart';
import 'package:lettutor_app/services/facebook_sign_in.dart';
import 'package:lettutor_app/services/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'border_icon_button.dart';

class LoginFacebookGoogle extends StatefulWidget {
  const LoginFacebookGoogle({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginFacebookGoogle> createState() => _LoginFacebookGoogleState();
}

class _LoginFacebookGoogleState extends State<LoginFacebookGoogle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Or continue wiith").tr(),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: const BorderIconButton(
                  iconName: "assets/images/icons8-google.svg"),
              onTap: () async {
                String token = await signInWithGoogle();
                final result = await AuthAPI().loginByGoogle(token);
                if (result["statusCode"] == 200) {
                  String newToken = result["token"];
                  LocalSP().setAccessToken(newToken);
                  Provider.of<LocalApp>(context, listen: false)
                      .setAccessToken(newToken);
                }
                if (result["statusCode"] == 500) {
                  _showMyDialog(title: "Error", message: result["message"]);
                }
              },
              borderRadius: BorderRadius.circular(50),
            ),
            const SizedBox(width: 20),
            InkWell(
              child: const BorderIconButton(
                  iconName: "assets/images/icons8-facebook.svg"),
              onTap: () async {
                String token = await signInWithFacebook();
                // print(token);
                final result = await AuthAPI().loginByFacebook(token);
                if (result["statusCode"] == 200) {
                  String newToken = result["token"];
                  LocalSP().setAccessToken(newToken);
                  Provider.of<LocalApp>(context, listen: false)
                      .setAccessToken(newToken);
                }
                if (result["statusCode"] == 500) {
                  _showMyDialog(title: "Error", message: result["message"]);
                }
              },
              borderRadius: BorderRadius.circular(50),
            ),
          ],
        ),
      ],
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
