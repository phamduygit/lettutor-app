import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:lettutor_app/models/teacher.dart';
import 'package:lettutor_app/screens/detail_teacher/detail_teacher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'components/tutor_card.dart';

class Tutors extends StatefulWidget {
  const Tutors({Key? key}) : super(key: key);

  @override
  State<Tutors> createState() => _TutorsState();
}

class _TutorsState extends State<Tutors> {
  late TextEditingController _textController;
  // Teacher teacher = listTeacher[0];
  List<Teacher> filterTeacher = listTeacher;
  String selectedSpecifier = ("All");
  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: '');
  }

  void filter() {
    filterTeacher = listTeacher
        .where((element) =>
            (element.name
                .toLowerCase()
                .contains(_textController.text.toLowerCase())) &&
            (selectedSpecifier == ("All") ||
                element.specialties.contains(selectedSpecifier)))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    List<String> specifiers = [
      "All",
      "English for kids",
      "English for business",
      "Conversational",
      "STARTERS",
      "MOVERS",
      "FLYERS",
      "KET",
      "PET",
      "IELTS",
      "TOEFL",
      "TOEIC",
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tutors",
          style: TextStyle(fontWeight: FontWeight.w500),
        ).tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CupertinoSearchTextField(
                controller: _textController,
                prefixInsets:
                    const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                onChanged: (value) {
                  setState(() {
                    filter();
                  });
                },
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    specifiers.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSpecifier = (specifiers[index]);
                              filter();
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(
                              specifiers[index],
                              style: TextStyle(
                                color: specifiers[index] == selectedSpecifier
                                    ? mainColor
                                    : null,
                              ),
                            ).tr(),
                            decoration: BoxDecoration(
                              color: (specifiers[index]) == selectedSpecifier
                                  ? Colors.blue[100]
                                  : Colors.grey.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: List.generate(
                  filterTeacher.length,
                  (index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailTeacher(
                            teacher: filterTeacher[index],
                          ),
                        ),
                      );
                    },
                    child: TutorCard(
                      teacher: filterTeacher[index],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
