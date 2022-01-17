import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:lettutor_app/screens/up_comming/components/meeting_card.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class Upcomming extends StatelessWidget {
  const Upcomming({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final listMeeting = context.watch<ListMeeting>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upcoming").tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        // child: Column(
        //   children: List.generate(
        //     listMeeting.getUpcomming().length,
        //     (index) => MeetingCard(
        //       meeting: listMeeting.getUpcomming()[index],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
