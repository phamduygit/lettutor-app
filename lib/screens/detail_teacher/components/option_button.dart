import 'package:flutter/material.dart';
import 'package:lettutor_app/contants.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({
    Key? key, required this.title, required this.icon, required this.press,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Icon(icon, color: mainColor,),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: mainColor,
              ),
            )
          ],
        ),
      ),
      borderRadius: BorderRadius.circular(5),
    );
  }
}