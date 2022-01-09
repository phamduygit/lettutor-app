import 'package:flutter/material.dart';
import 'package:lettutor_app/data/provider/user_provider.dart';
import 'package:lettutor_app/data/sql_lite/user_dao.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class NormalTextFormField extends StatelessWidget {
  const NormalTextFormField({
    Key? key,
    required this.hintText,
    required this.title,
    required this.name,
  }) : super(key: key);
  final String hintText;
  final String title;
  final String name;
  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        const SizedBox(height: 10),
        TextFormField(
          keyboardType: TextInputType.text,
          maxLines: null,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: hintText,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return tr('Please enter some text');
            }
            return null;
          },
          initialValue: name,
          onSaved: (val) {
            user.name = val!;
            user.updateUser(user);
            // UserDAO().update(user);
          },
        ),
      ],
    );
  }
}
