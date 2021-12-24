import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    Key? key, required this.icon, required this.title, required this.press,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).primaryColor,
          // onPrimary: Colors.black,
          padding: const EdgeInsets.all(12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 5
        ),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 5),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            const Icon(Icons.chevron_right)
          ],
        ),
        onPressed: press,
      ),
    );
  }
}
