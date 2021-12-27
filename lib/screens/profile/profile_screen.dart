import 'package:flutter/material.dart';
import 'package:lettutor_app/screens/profile/components/body.dart';
import 'package:easy_localization/easy_localization.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile").tr(),
      ),
      body: const Body(),
    );
  }
}
