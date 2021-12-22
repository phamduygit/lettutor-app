import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:lettutor_app/data/provider/list_meeting.dart';
import 'package:provider/provider.dart';

import 'components/session_history_card.dart';

class SessionHistoryScreen extends StatefulWidget {
  const SessionHistoryScreen({Key? key}) : super(key: key);

  @override
  State<SessionHistoryScreen> createState() => _SessionHistoryScreenState();
}

class _SessionHistoryScreenState extends State<SessionHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final listMeeting = context.watch<ListMeeting>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Session History"),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          children: [
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
                listMeeting.getFinishedMeeting().length,
                (index) => SessionHistoryCard(
                  meeting: listMeeting.getFinishedMeeting()[index],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
