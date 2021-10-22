import 'package:flutter/material.dart';
import 'package:lettutor_app/contants.dart';
import 'package:lettutor_app/models/meeting.dart';
import 'package:lettutor_app/screens/up_comming/components/meeting_card.dart';

class Upcomming extends StatelessWidget {
  const Upcomming({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upcoming"),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          children: List.generate(
            listMeeting.length,
            (index) => MeetingCard(
              meeting: listMeeting[index],
            ),
          ),
        ),
      ),
    );
  }
}
