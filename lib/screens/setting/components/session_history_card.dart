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
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  // CircleAvatar(
                  //   backgroundImage: NetworkImage(meeting.avatar),
                  //   radius: 30,
                  // ),
                  const SizedBox(width: 10),
                  // Expanded(
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         meeting.name,
                  //         style: const TextStyle(fontSize: 18),
                  //       ),
                  //       const SizedBox(height: 5),
                  //       Row(
                  //         children: [
                  //           const Icon(
                  //             Icons.calendar_today_outlined,
                  //             size: 15,
                  //           ),
                  //           const SizedBox(width: 10),
                  //           Text(
                  //             DateFormat('HH:mm:ss dd/MM/yyyy')
                  //                 .format(meeting.date),
                  //             style: const TextStyle(fontSize: 15),
                  //           )
                  //         ],
                  //       ),
                  //       const SizedBox(height: 5),
                  //       Row(
                  //         children: const [
                  //           Icon(
                  //             Icons.timer_outlined,
                  //             size: 15,
                  //           ),
                  //           SizedBox(width: 10),
                  //           Text(
                  //             "14:48:49",
                  //             style: TextStyle(fontSize: 15),
                  //           )
                  //         ],
                  //       ),
                  //       const SizedBox(height: 5),
                  //       Row(
                  //         children: const [
                  //           Icon(
                  //             Icons.star_border_rounded,
                  //             size: 20,
                  //           ),
                  //           SizedBox(width: 10),
                  //           Text(
                  //             "Not feedback yet",
                  //             style: TextStyle(fontSize: 15),
                  //           )
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // )
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FeedbackScreen(meeting: meeting),
                          ),
                        );
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
