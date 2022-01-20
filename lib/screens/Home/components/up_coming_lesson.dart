import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lettutor_app/data/api/schedule_api.dart';
import 'package:lettutor_app/models/meeting_data.dart';
import 'package:lettutor_app/models/meeting_info.dart';

class UpComingLesson extends StatefulWidget {
  const UpComingLesson({
    Key? key,
  }) : super(key: key);

  @override
  State<UpComingLesson> createState() => _UpComingLessonState();
}

class _UpComingLessonState extends State<UpComingLesson> {
  MeetingData meetingData = MeetingData();
  MeetingData historyMeeting = MeetingData();
  Future getData() async {
    final value = await ScheduleAPI().getUpcomming(1, 20);
    final value1 = await ScheduleAPI().getBookedClass(1, 20);
    if (mounted) setState(() {});
    setState(() {
      meetingData = MeetingData.fromJson(value["data"]);
      historyMeeting = MeetingData.fromJson(value1["data"]);
    });
  }

  String durationToString(int minutes) {
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')} ${tr('hours')} ${parts[1].padLeft(2, '0')} ${tr('minutes')}';
  }

  String upcommingString() {
    if ((meetingData.rows?.length ?? 0) == 0) {
      return "";
    }
    return DateFormat('EE, dd MMM yy HH:mm -',
                context.fallbackLocale.toString() == "vi_VN" ? "vi" : "en")
            .format(
          DateTime.fromMillisecondsSinceEpoch(
            meetingData.rows![0].getTutor().startTime,
          ),
        ) +
        DateFormat(
          ' HH:mm',
        ).format(
          DateTime.fromMillisecondsSinceEpoch(
            meetingData.rows![0].getTutor().endSession,
          ),
        );
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
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Text(
            "${tr("Total lesson time is")} ${durationToString(historyMeeting.count * 25)}",
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
           Text(
            upcommingString() != ""? "Upcoming Lesson" : "You have no upcoming lesson, click below to book",
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ).tr(),
          const SizedBox(height: 10),
          Text(
            upcommingString(),
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            child:  Text(
              upcommingString() != ""? "Enter lesson room" : "Book a lesson",
              style: const TextStyle(fontSize: 14),
            ).tr(),
            onPressed: () {
              if (upcommingString() == "") {

              } else {
                _joinMeeting(context: context, meetingInfo: meetingData.rows![0].getTutor());
              }
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: mainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              padding: const EdgeInsets.all(10),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
      color: secondColor,
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
        ..userAvatarURL = "https://sandbox.app.lettutor.com/static/media/lettutor_logo.91f91ade.svg" // or .png
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
