import 'package:flutter/material.dart';
import 'package:lettutor_app/models/meeting.dart';
import 'package:lettutor_app/screens/setting/feedback.dart';

class SessionHistoryCard extends StatelessWidget {
  const SessionHistoryCard({
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
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: const [
                            Icon(
                              Icons.calendar_today_outlined,
                              size: 15,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "02:30:00, 23/10/2021",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: const [
                            Icon(
                              Icons.timer_outlined,
                              size: 15,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "14:48:49",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: const [
                            Icon(
                              Icons.star_border_rounded,
                              size: 20,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Not feedback yet",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const FeedbackScreen()));
                      },
                      child: const Text("Give Feedback"),
                      style:
                          ElevatedButton.styleFrom(primary: Colors.yellow[800]),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("See Tutor Details"),
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
