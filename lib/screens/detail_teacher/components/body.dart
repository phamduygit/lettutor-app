import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_app/contants.dart';
import 'package:lettutor_app/models/pattern.dart';
import 'package:readmore/readmore.dart';

import 'booking_button.dart';
import 'courses.dart';
import 'option_button.dart';
import 'over_view_teacher.dart';
import 'reviews.dart';
import 'title_and_chips.dart';
import 'title_and_paragraph.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var heightScreen = MediaQuery.of(context).size.height;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: heightScreen * 0.3,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const OverViewTeacher(),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OptionButton(
                        icon: Icons.chat_outlined,
                        title: "Message",
                        press: () {},
                      ),
                      OptionButton(
                        icon: CupertinoIcons.heart,
                        title: "Favorite",
                        press: () {},
                      ),
                      OptionButton(
                        icon: Icons.report_gmailerrorred_rounded,
                        title: "Report",
                        press: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  BookingButton(today: DateTime.now()),
                  const SizedBox(height: 10),
                  ReadMoreText(
                    descriptionPattern,
                    trimLines: 5,
                    style: TextStyle(
                        fontSize: 16, color: Colors.black.withOpacity(0.6)),
                    colorClickableText: Colors.black,
                    trimMode: TrimMode.Line,
                    delimiter: ' ',
                    moreStyle:
                        const TextStyle(fontSize: 16, color: Colors.black),
                    lessStyle:
                        const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const TitileAndChips(
                    title: "Language",
                    chipsContent: ["English", "Vietnamese"],
                  ),
                  const TitleAndParagraph(
                    title: "Interest",
                    paragraph: interests,
                  ),
                  const TitleAndParagraph(
                    title: "Teaching experience",
                    paragraph: experience,
                  ),
                  const TitileAndChips(
                    title: "Specialties",
                    chipsContent: [
                      "English for kids",
                      "English for business",
                      "Conversational",
                      "STARTERS",
                      "MOVERS",
                      "PET",
                      "KET",
                      "IELTS",
                      "TOEFL"
                    ],
                  ),
                  const Courses(),
                  const Reviews(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



