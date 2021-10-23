import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_app/models/meeting.dart';
import 'package:lettutor_app/screens/up_comming/video_call_screen.dart';

class MeetingCard extends StatelessWidget {
  const MeetingCard({
    Key? key,
    required this.meeting,
  }) : super(key: key);
  final Meeting meeting;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(meeting.avatar),
                    radius: 30,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          meeting.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(DateFormat("yyyy-MM-dd").format(meeting.date)),
                            const SizedBox(width: 5),
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.green[100]),
                              child: Text(
                                DateFormat("HH:mm").format(meeting.date),
                                style: const TextStyle(
                                    fontSize: 10, color: Colors.green),
                              ),
                            ),
                            const Text("-"),
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.red[100]),
                              child: Text(
                                DateFormat("HH:mm").format(meeting.date.add(const Duration(minutes: 25))),
                                style: const TextStyle(fontSize: 10, color: Colors.red),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Cancel"),
                      style: ElevatedButton.styleFrom(primary: Colors.grey),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const VideoCallSreen()));
                      },
                      child: const Text("Join"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
