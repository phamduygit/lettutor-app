import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';
class UpdateButton extends StatelessWidget {
  const UpdateButton({
    Key? key, required this.press,
  }) : super(key: key);
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        primary: mainColor,
      ),
      child: Row(
        children:  [
          const Spacer(),
          const Text(
            "Update",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ).tr(),
          const Spacer(),
        ],
      ),
    );
  }
}