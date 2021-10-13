import 'package:flutter/material.dart';

class NormalFormField extends StatelessWidget {
  const NormalFormField({Key? key, required this.titleTextFiled, required this.placeHolder}) : super(key: key);
  final String titleTextFiled;
  final String placeHolder;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              titleTextFiled,
              style: const TextStyle(color: Colors.black45),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        const SizedBox(height: 15),
        TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: placeHolder,
          ),
        ),
      ],
    );
  }
}
