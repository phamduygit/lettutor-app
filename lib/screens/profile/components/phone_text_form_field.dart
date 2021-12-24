import 'package:flutter/material.dart';
import 'package:lettutor_app/models/user.dart';
import 'package:lettutor_app/data/sql_lite/user_dao.dart';
import 'package:provider/provider.dart';

class PhoneTextFormField extends StatelessWidget {
  const PhoneTextFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<User>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              "Phone Number",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        const SizedBox(height: 10),
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Enter your phone number",
          ),
          initialValue: user.phone,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            } else {
              if (!RegExp(r"^(?:[+0]9)?[0-9]{10}$").hasMatch(value)) {
                return 'Invalid phone number';
              }
            }
            return null;
          },
          onSaved: (val) {
            user.phone = val!;
            user.updateUser(user);
            UserDAO().update(user);
          },
        ),
      ],
    );
  }
}
