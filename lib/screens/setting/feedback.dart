import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:lettutor_app/data/api/tutor_api.dart';
import 'package:lettutor_app/models/meeting.dart';
import 'package:lettutor_app/screens/setting/components/rating.dart';
import 'package:easy_localization/easy_localization.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key, required this.meeting}) : super(key: key);
  final Meeting meeting;

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  int numberOfStar = 5;
  String comment = "";
  final _formKey = GlobalKey<FormState>();
  void saveNumberOfStar(value) {
    setState(() {
      numberOfStar = value;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feedback").tr(),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Rate Your Tutor",
                      style: TextStyle(fontSize: 18, color: mainColor),
                    ).tr(),
                    const SizedBox(height: 10),
                    const Text(
                      "How was your Study?",
                      style: TextStyle(fontSize: 18),
                    ).tr(),
                    const SizedBox(height: 10),
                    CircleAvatar(
                      backgroundImage: NetworkImage(widget.meeting.getTutor().userBeCalled!.avatar),
                      radius: 40,
                    ),
                    Text(
                      widget.meeting.getTutor().userBeCalled!.name,
                      style: const TextStyle(fontSize: 18),
                    ),
                    RatingStar(
                      saveNumberOfStar: saveNumberOfStar,
                      numberOfStar: numberOfStar,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      const Text(
                        "Leave your comment",
                        style: TextStyle(fontSize: 18),
                      ).tr(),
                      const SizedBox(height: 20),
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: tr("Leave your throught about this study"),
                        ),
                        maxLines: null,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return tr('Please enter some text');
                          }
                          return null;
                        },
                        onSaved: (value) {
                          setState(() {
                            comment = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        child: Row(
                          children: [
                            const Spacer(),
                            const Text(
                              "Submit",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ).tr(),
                            const Spacer(),
                          ],
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            await TutorAPI().writeReview(widget.meeting.getTutor().bookingId, widget.meeting.userId, numberOfStar, comment);
                            // Navigator.pop(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.all(12)),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
