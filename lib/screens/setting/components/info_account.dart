import 'package:flutter/material.dart';
import 'package:lettutor_app/contants.dart';

class InfoAccount extends StatelessWidget {
  const InfoAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            children: const [
              Text("Pham Duy", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
              SizedBox(height: 10),
              Text("18120345@student.hcmus.edu.vn"),
            ],
          )
        ],
      ),
    );
  }
}