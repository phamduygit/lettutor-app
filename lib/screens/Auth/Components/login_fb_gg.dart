import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'border_icon_button.dart';

class LoginFacebookGoogle extends StatelessWidget {
  const LoginFacebookGoogle({
    Key? key,
  }) : super(key: key);

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
                // await signInWithGoogle();
              },
              borderRadius: BorderRadius.circular(50),
            ),
            const SizedBox(width: 20),
            InkWell(
              child: const BorderIconButton(
                  iconName: "assets/images/icons8-facebook.svg"),
              onTap: () async {
                // await signInWithFacebook();
              },
              borderRadius: BorderRadius.circular(50),
            ),
          ],
        ),
      ],
    );
  }
}
