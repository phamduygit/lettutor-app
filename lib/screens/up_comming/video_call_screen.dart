import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:lettutor_app/models/meeting.dart';

class VideoCallSreen extends StatefulWidget {
  const VideoCallSreen({Key? key, required this.meeting}) : super(key: key);

  @override
  State<VideoCallSreen> createState() => _VideoCallSreenState();
  final Meeting meeting;
}

class _VideoCallSreenState extends State<VideoCallSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Tutoring Meeting Room",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(width: 15),
                            Text(
                              "00:20",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: const Text(
                          "You are the only one in the meeting",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 150,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "Lesson will be started after",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 15),
                          CountdownTimer(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            // endTime: widget.meeting.date.millisecondsSinceEpoch,
                          ),
                        ],
                      ),
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
}
