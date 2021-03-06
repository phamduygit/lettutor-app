import 'package:flutter/material.dart';
import 'package:lettutor_app/data/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class PhoneTextFormField extends StatelessWidget {
  const PhoneTextFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              tr("Phone Number"),
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
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: tr("Enter your phone number"),
          ),
          initialValue: user.phone,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return tr('Please enter some text');
            } else {
              if (!RegExp(r"^(?:[+0]9)?[0-9]{12}$").hasMatch(value)) {
                return tr('Invalid phone number');
              }
            }
            return null;
          },
          onSaved: (val) {
            user.phone = val!;
            user.updateUser(user);
            // UserDAO().update(user);
          },
        ),
      ],
    );
  }
}
