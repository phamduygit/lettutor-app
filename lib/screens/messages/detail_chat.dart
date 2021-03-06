import 'package:flutter/material.dart';
import 'package:lettutor_app/models/people.dart';
import 'package:easy_localization/easy_localization.dart';

class DetailChat extends StatefulWidget {
  const DetailChat({Key? key, required this.people}) : super(key: key);
  final People people;

  @override
  State<DetailChat> createState() => _DetailChatState();
}

class _DetailChatState extends State<DetailChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.people.avatar),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.people.username,
                  style: const TextStyle(fontSize: 14),
                ),
                const Text(
                  "Teacher",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                ).tr(),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: List.generate(
                  widget.people.messages.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.blue),
                          child: Text(widget.people.messages[index].content, style: const TextStyle(fontSize: 16),),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black)),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Input your text",
                    border: InputBorder.none,
                    suffixIcon: IconButton(onPressed: () {}, icon: const Icon(Icons.send))
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
