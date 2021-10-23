import 'package:flutter/material.dart';

class LevelTextFormField extends StatefulWidget {
  const LevelTextFormField({
    Key? key,
  }) : super(key: key);

  @override
  State<LevelTextFormField> createState() => _LevelTextFormFieldState();
}

enum SingingCharacter {
  beginer,
  highBeginer,
  preInter,
  inter,
  upperInter,
  advanced,
  profici,
}

class _LevelTextFormFieldState extends State<LevelTextFormField> {
  static final List<String> _levels = [
    "Beginner",
    "Higher Beginner",
    "Pre-Intermediate",
    "Intermediate",
    "Upper-Intermediate",
    "Advanced",
    "Proficiency",
  ];
  var level = TextEditingController();
  SingingCharacter? _character = SingingCharacter.beginer;
  @override
  void initState() {
    level.text = _levels[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              "My Level",
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
          controller: level,
          readOnly: true,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Enter your name",
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
                        children: _levels
                            .map(
                              (e) => RadioListTile<SingingCharacter>(
                                value:
                                    SingingCharacter.values[_levels.indexOf(e)],
                                title: Text(e),
                                groupValue: _character,
                                onChanged: (newValue) {
                                  setState(() {
                                    _character = newValue;
                                  });
                                  level.text = e;
                                  // Navigator.of(context).pop();
                                },
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
                      },
                      child: const Text("Ok"),
                    )
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
