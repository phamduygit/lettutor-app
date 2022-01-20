import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lettutor_app/data/api/schedule_api.dart';
import 'package:lettutor_app/models/meeting_data.dart';
import 'package:lettutor_app/screens/setting/components/session_history_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SessionHistoryScreen extends StatefulWidget {
  const SessionHistoryScreen({Key? key}) : super(key: key);

  @override
  State<SessionHistoryScreen> createState() => _SessionHistoryScreenState();
}

class _SessionHistoryScreenState extends State<SessionHistoryScreen> {
  MeetingData meetingData = MeetingData();
  Future getData() async {
    final value = await ScheduleAPI().getBookedClass(1, lastPerPage);
    setState(() {
      meetingData = MeetingData.fromJson(value["data"]);
    });   
  }
  int lastPerPage = 10;
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
    lastPerPage += 10;
    // if (mounted) setState(() {});
    getData();
    _refreshController.loadComplete();
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
        title: const Text("Session history").tr(),
      ),
      body: SmartRefresher(
        enablePullDown: false,
        enablePullUp: true,
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              children: [
                const SizedBox(height: 12),
                CupertinoSearchTextField(
                  // controller: _textController,
                  prefixInsets:
                      const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                Column(
                  children: List.generate(
                    meetingData.rows?.length ?? 0,
                    (index) => SessionHistoryCard(
                      meeting: meetingData.rows![index],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
