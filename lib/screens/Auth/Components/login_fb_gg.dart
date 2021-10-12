import 'package:flutter/material.dart';

import 'border_icon_button.dart';

class LoginFacebookGoogle extends StatelessWidget {
  const LoginFacebookGoogle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Or continue wiith"),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: const BorderIconButton(
                  iconName: "assets/images/icons8-google.svg"),
              onTap: () {},
              borderRadius: BorderRadius.circular(50),
            ),
            const SizedBox(width: 20),
            InkWell(
              child: const BorderIconButton(
                  iconName: "assets/images/icons8-facebook.svg"),
              onTap: () {},
              borderRadius: BorderRadius.circular(50),
            ),
          ],
        ),
      ],
    );
  }
}
