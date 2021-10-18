import 'package:flutter/material.dart';
import 'package:lettutor_app/contants.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        primary: mainColor,
      ),
      child: Row(
        children: const [
          Spacer(),
          Text(
            "Update",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}