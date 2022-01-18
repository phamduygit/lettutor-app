import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';

class SessionHistoryScreen extends StatefulWidget {
  const SessionHistoryScreen({Key? key}) : super(key: key);

  @override
  State<SessionHistoryScreen> createState() => _SessionHistoryScreenState();
}

class _SessionHistoryScreenState extends State<SessionHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    // final listMeeting = context.watch<ListMeeting>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Session history").tr(),
      ),
      body: Padding(
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
            // Column(
            //   children: List.generate(
            //     listMeeting.getFinishedMeeting().length,
            //     (index) => SessionHistoryCard(
            //       meeting: listMeeting.getFinishedMeeting()[index],
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
