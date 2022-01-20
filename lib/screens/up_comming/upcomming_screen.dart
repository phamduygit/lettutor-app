import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lettutor_app/data/api/schedule_api.dart';
import 'package:lettutor_app/models/meeting.dart';
import 'package:lettutor_app/models/meeting_data.dart';
import 'package:lettutor_app/screens/up_comming/components/meeting_card.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Upcomming extends StatefulWidget {
  const Upcomming({Key? key}) : super(key: key);

  @override
  State<Upcomming> createState() => _UpcommingState();
}

class _UpcommingState extends State<Upcomming> {
  MeetingData meetingData = MeetingData();
  Future getData() async {
    final value = await ScheduleAPI().getUpcomming(1, lastPerPage);
    if (mounted) setState(() {});
    setState(() {
      meetingData = MeetingData.fromJson(value["data"]);
    });   
  }
  int lastPerPage = 6;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    lastPerPage += 6;
    if (mounted) setState(() {});
    getData();
    _refreshController.loadComplete();
  }
  void remove(Meeting meeting) {
    setState(() {
      meetingData.rows!.remove(meeting);
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
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => meetingData)
        ],
        child: SmartRefresher(
          enablePullDown: false,
          enablePullUp: true,
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                children: List.generate(
                  meetingData.rows?.length ?? 0,
                  (index) => MeetingCard(
                    meeting: meetingData.rows![index],
                    remove: remove,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
