import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lettutor_app/data/api/schedule_api.dart';
import 'package:lettutor_app/data/provider/schedule_data.dart';
import 'package:lettutor_app/models/teacher_info.dart';
import 'package:provider/provider.dart';
import 'date_button.dart';

class BookingButton extends StatefulWidget {
  const BookingButton({
    Key? key,
    required this.today,
    required this.teacher,
  }) : super(key: key);
  final DateTime today;
  final TeacherInfo teacher;

  @override
  State<BookingButton> createState() => _BookingButtonState();
}

class _BookingButtonState extends State<BookingButton> {
  ScheduleData scheduleData = ScheduleData();
  bool _isLoading = false;
  Future getData() async {
    setState(() {
      _isLoading = true;
    });
    final value = await ScheduleAPI().getScheduleById(widget.teacher.userId);
    if (mounted) {
      setState(() {
        scheduleData = ScheduleData.fromJson(value);
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    super.dispose();
    scheduleData = ScheduleData();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Row(
        children: [
          const Spacer(),
          const Text(
            "Booking",
            style: TextStyle(fontSize: 18),
          ).tr(),
          const Spacer(),
        ],
      ),
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return _isLoading
                ? const Center(child: CircularProgressIndicator())
                : MultiProvider(
                    providers: [
                      ChangeNotifierProvider(create: (context) => scheduleData),
                    ],
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(defaultPadding),
                            child: const Text(
                              "Select your date!",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ).tr(),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: defaultPadding),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: List.generate(
                                    7,
                                    (index) => DateButton(
                                      date: DateTime.now()
                                          .add(Duration(days: index)),
                                      teacher: widget.teacher,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(defaultPadding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
