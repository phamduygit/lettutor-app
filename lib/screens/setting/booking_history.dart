import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:lettutor_app/screens/setting/components/booking_history_card.dart';
import 'package:lettutor_app/data/provider/list_meeting.dart';
import 'package:provider/provider.dart';

class BookingHistory extends StatelessWidget {
  const BookingHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listMeeting = context.watch<ListMeeting>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking History"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          children: List.generate(
            listMeeting.list.length,
            (index) => BookingHistoryCard(
              meeting: listMeeting.list[index],
            ),
          ),
        ),
      ),
    );
  }
}
