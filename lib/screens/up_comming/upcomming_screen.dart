import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:lettutor_app/screens/up_comming/components/meeting_card.dart';
import 'package:lettutor_app/service/provider/list_meeting.dart';
import 'package:provider/provider.dart';

class Upcomming extends StatelessWidget {
  const Upcomming({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listMeeting = context.watch<ListMeeting>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upcoming"),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          children: List.generate(
            listMeeting.getUpcomming().length,
            (index) => MeetingCard(
              meeting: listMeeting.getUpcomming()[index],
            ),
          ),
        ),
      ),
    );
  }
}
