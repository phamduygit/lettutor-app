import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_app/models/people.dart';
import 'package:lettutor_app/screens/messages/detail_chat.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key? key,
    required this.people,
  }) : super(key: key);
  final People people;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailChat(
                people: people,
              ),
            ),
          );
        },
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(people.avatar),
                  radius: 30,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                      border: Border.all(width: 2, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    people.username,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("You: ${people.messages.last.content}"),
                      Text(DateFormat("hh:mm")
                          .format(people.messages.last.dateTime)),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
