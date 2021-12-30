import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:lettutor_app/data/provider/user_provider.dart';
import 'package:provider/provider.dart';

class InfoAccount extends StatelessWidget {
  const InfoAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<UserProvider>();
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/avatar.jpeg"),
            radius: 30,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.fullName,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Text(user.email),
            ],
          )
        ],
      ),
    );
  }
}
