import 'package:flutter/material.dart';
import 'package:lettutor_app/data/provider/user_provider.dart';
import 'package:provider/provider.dart';

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              "Email address",
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
          enabled: false,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Enter your email",
          ),
          initialValue: user.email,
          onSaved: (val) {
            // user.email = val!;
            // user.updateUser(user);
            // UserDAO().update(user);
          },
        ),
      ],
    );
  }
}