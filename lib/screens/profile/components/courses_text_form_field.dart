import 'package:flutter/material.dart';
import 'package:lettutor_app/models/user.dart';
import 'package:lettutor_app/data/sql_lite/user_dao.dart';
import 'package:provider/provider.dart';

class CoursesTextFormField extends StatefulWidget {
  const CoursesTextFormField({
    Key? key, required this.title, required this.hintText,
  }) : super(key: key);
  final String title;
  final String hintText;
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
    value.text = context.read<User>().target.join("-");
    selectedCourses = context.read<User>().target;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<User>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
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
          readOnly: true,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: widget.hintText,
          ),
          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return 'Please enter some text';
          //   }
          //   return null;
          // },
          onSaved: (val) {
            user.target = selectedCourses;
            user.updateUser(user);
            UserDAO().update(user);
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
                        value.text = selectedCourses.join("-");
                        Navigator.of(context).pop();
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
