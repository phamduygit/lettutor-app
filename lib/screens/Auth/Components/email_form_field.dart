import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    Key? key,
    required this.saveEmail,
  }) : super(key: key);
  final void Function(String) saveEmail;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "EMAIL",
              textAlign: TextAlign.left,
            ).tr(),
          ],
        ),
        const SizedBox(height: 15),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: tr("Enter your email"),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return tr('Please enter some text');
            } else {
              if (!RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value)) {
                return tr('Invalid email');
              }
            }
            return null;
          },
          onSaved: (val) {
            saveEmail(val!);
          },
        ),
      ],
    );
  }
}
