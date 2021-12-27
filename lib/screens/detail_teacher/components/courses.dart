import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';

class Courses extends StatelessWidget {
  const Courses({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Courses",
            style: TextStyle(fontSize: 16, color: mainColor),
          ).tr(),
          const SizedBox(height: 10),
          Container(height: 200, width: 180, color: Colors.grey,),
        ],
      ),
    );
  }
}
