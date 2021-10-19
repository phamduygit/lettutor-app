import 'package:flutter/material.dart';
import 'package:lettutor_app/contants.dart';

class TitleAndParagraph extends StatelessWidget {
  const TitleAndParagraph({
    Key? key, required this.title, required this.paragraph,
  }) : super(key: key);
  final String title;
  final String paragraph;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, color: mainColor),
          ),
          const SizedBox(height: 10),
          Text(paragraph),
        ],
      ),
    );
  }
}
