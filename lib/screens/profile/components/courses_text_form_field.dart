import 'package:flutter/material.dart';

class CoursesTextFormField extends StatefulWidget {
  const CoursesTextFormField({
    Key? key,
  }) : super(key: key);

  @override
  State<CoursesTextFormField> createState() => _CoursesTextFormFieldState();
}

class _CoursesTextFormFieldState extends State<CoursesTextFormField> {
  static final List<String> _courses = [
    "English for kids",
    "Business English",
    "Conversational English",
    "STARTERS",
    "MOVERS",
    "FLYERS",
    "KET",
    "PET",
    "IELTS",
    "TOEFL",
    "TOEIC",
  ];
  List<String> selectedCourses = [];
  var value = TextEditingController();
  @override
  void initState() {
    value.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              "Want to learn",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: value,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Chose courses you want to learn",
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          onTap: () => showDialog(
            context: context,
            builder: (context) {
              return StatefulBuilder(builder: (context, setState) {
                return AlertDialog(
                  title: const Text("Select your level"),
                  content: SingleChildScrollView(
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: _courses
                            .map(
                              (e) => CheckboxListTile(
                                value: selectedCourses.contains(e),
                                onChanged: (value) {
                                  setState(() {
                                    value!
                                        ? selectedCourses.add(e)
                                        : selectedCourses.removeWhere(
                                            (element) => element == e);
                                  });
                                },
                                title: Text(e),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        value.text = "";
                        for (var i = 0; i < selectedCourses.length; i++) {
                          value.text += selectedCourses[i] + ", ";
                        }
                      },
                      child: const Text("Ok"),
                    ),
                  ],
                );
              });
            },
          ),
        ),
      ],
    );
  }
}
