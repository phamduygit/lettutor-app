import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:lettutor_app/models/meeting.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lettutor_app/models/meeting_info.dart';

class MeetingCard extends StatelessWidget {
  const MeetingCard({
    Key? key,
    required this.meeting,
  }) : super(key: key);
  final Meeting meeting;
  @override
  Widget build(BuildContext context) {
    final meetingInfo = meeting.getTutor();
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage(meetingInfo.userBeCalled!.avatar),
                    radius: 30,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          meetingInfo.userBeCalled!.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(DateFormat("yyyy-MM-dd").format(
                                DateTime.fromMillisecondsSinceEpoch(
                                    meetingInfo.startTime))),
                            const SizedBox(width: 5),
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.green[100]),
                              child: Text(
                                DateFormat("HH:mm").format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        meetingInfo.startTime)),
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
                                DateFormat("HH:mm").format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        meetingInfo.endSession)),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _showMyDialog(context, title: "title", message: "message");
                      },
                      child: const Text("Cancel").tr(),
                      style: ElevatedButton.styleFrom(primary: Colors.grey),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _joinMeeting(
                            context: context, meetingInfo: meetingInfo);
                        // showDialogLanguage(context);
                      },
                      child: const Text("Join").tr(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _showMyDialog(BuildContext context,
      {required String title, required String message}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
  _joinMeeting(
      {required BuildContext context, required MeetingInfo meetingInfo}) async {
    // String tokenUser = await LocalSP().getAccessToken();
    try {
      Map<FeatureFlagEnum, bool> featureFlags = {
        FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
      };
      if (Platform.isAndroid) {
        // Disable ConnectionService usage on Android to avoid issues (see README)
        featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
      } else if (Platform.isIOS) {
        // Disable PIP on iOS as it looks weird
        featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
      }
      var options = JitsiMeetingOptions(room: meetingInfo.room)
        ..subject = "Meeting with Gunschu"
        ..userDisplayName = meetingInfo.userCall?.name ?? "abc"
        ..userEmail = meetingInfo.userCall?.email ?? "user@gmail.com"
        ..userAvatarURL = meetingInfo.userCall?.avatar ?? "" // or .png
        ..audioOnly = true
        ..audioMuted = true
        ..videoMuted = true
        // ..token = tokenUser
        // ..serverURL = "https://meet.tutoring.letstudy.io"
        ..featureFlags.addAll(featureFlags);

      await JitsiMeet.joinMeeting(
        options,
        listener: JitsiMeetingListener(
          onConferenceWillJoin: (message) {
            debugPrint("${options.room} will join with message: $message");
          },
        ),
      );
    } catch (error) {
      debugPrint("error: $error");
    }
  }
}
