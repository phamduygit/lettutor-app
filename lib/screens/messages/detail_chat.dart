import 'package:flutter/material.dart';
import 'package:lettutor_app/models/people.dart';

class DetailChat extends StatelessWidget {
  const DetailChat({Key? key, required this.people}) : super(key: key);
  final People people;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(people.avatar),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(people.username, style: const TextStyle(fontSize: 14),),
                const Text("Teacher", style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),),
              ],
            ),
          ],
        ),
      ),
      body: Container(),
    );
  }
}
