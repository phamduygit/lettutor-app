import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lettutor_app/data/api/schedule_api.dart';
import 'package:lettutor_app/models/meeting_data.dart';
import 'package:lettutor_app/screens/up_comming/components/meeting_card.dart';

class Upcomming extends StatefulWidget {
  const Upcomming({Key? key}) : super(key: key);

  @override
  State<Upcomming> createState() => _UpcommingState();
}

class _UpcommingState extends State<Upcomming> {
  MeetingData meetingData = MeetingData();
  Future getData() async {
    final value = await ScheduleAPI().getUpcomming(1, 20);
    setState(() {
      meetingData = MeetingData.fromJson(value["data"]);
    });   
  }
  @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // final listMeeting = context.watch<ListMeeting>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upcoming").tr(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: List.generate(
              meetingData.rows?.length ?? 0,
              (index) => MeetingCard(
                meeting: meetingData.rows![index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
