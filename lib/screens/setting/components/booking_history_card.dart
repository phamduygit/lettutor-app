import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_app/models/meeting.dart';
import 'package:lettutor_app/models/meeting_info.dart';

class BookingHistoryCard extends StatelessWidget {
  const BookingHistoryCard({Key? key, required this.meeting}) : super(key: key);
  final Meeting meeting;
  @override
  Widget build(BuildContext context) {
    MeetingInfo meetingInfo = meeting.getTutor();
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage(meetingInfo.userBeCalled!.avatar),
                    radius: 30,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          meetingInfo.userBeCalled!.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              DateFormat("yyyy-MM-dd").format(
                                DateTime.fromMillisecondsSinceEpoch(
                                    meetingInfo.startTime),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.green[100]),
                              child: Text(
                                DateFormat("HH:mm").format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        meetingInfo.startTime)),
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
                                DateFormat("HH:mm").format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        meetingInfo.endSession)),
                                style: const TextStyle(
                                    fontSize: 10, color: Colors.red),
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
          ],
        ),
      ),
    );
  }
}
