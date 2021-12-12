import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:lettutor_app/models/meeting.dart';
import 'package:lettutor_app/models/teacher.dart';
import 'package:lettutor_app/models/user.dart';
import 'package:lettutor_app/screens/detail_teacher/components/over_view_teacher.dart';
import 'package:lettutor_app/service/provider/list_meeting.dart';
import 'package:lettutor_app/service/sql_lite/meeting_dao.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class BookingDetailScreen extends StatelessWidget {
  const BookingDetailScreen(
      {Key? key, required this.date, required this.teacher})
      : super(key: key);
  final DateTime date;
  final Teacher teacher;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking Detail"),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      OverViewTeacher(
                        teacher: teacher,
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Booking time:",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "${DateFormat('HH:mm').format(date)} - ${DateFormat('HH:mm').format(date)}",
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            DateFormat('EE, dd MM yyyy').format(date),
                            style: const TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Total:",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "You have a lesson left",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Notes:",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Send your message",
                            ),
                            maxLines: null,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Cancel",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(defaultPadding),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        primary: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Accept",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      onPressed: () async {
                        Meeting newMeeting = Meeting(
                          id: const Uuid().v4(),
                          userID: context.read<User>().id,
                          teacherID: teacher.id,
                          avatar: teacher.avatar,
                          name: teacher.name,
                          date: date,
                          status: 1,
                        );
                        await MeetingDAO().insertMeeting(newMeeting);
                        Provider.of<ListMeeting>(context, listen: false)
                            .addNewMeeting(newMeeting);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(defaultPadding),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        primary: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
