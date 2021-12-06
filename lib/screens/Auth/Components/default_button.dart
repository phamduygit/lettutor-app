import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.content,
    required this.press,
  }) : super(key: key);
  final String content;
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
        children: [
          const Spacer(),
          Text(
            content,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
