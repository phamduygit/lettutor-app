import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_app/models/meeting.dart';

class BookingHistoryCard extends StatelessWidget {
  const BookingHistoryCard({Key? key, required this.meeting}) : super(key: key);
  final Meeting meeting;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(meeting.avatar),
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
                                DateFormat("HH:mm").format(meeting.date
                                    .add(const Duration(minutes: 25))),
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
