import 'package:flutter/material.dart';
import 'package:lettutor_app/data/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class LevelTextFormField extends StatefulWidget {
  const LevelTextFormField({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
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
    "BEGINNER",
    "HIGHER_BEGINNER",
    "PRE_INTERMEDIATE",
    "INTERMEDIATE",
    "UPPER_INTERMEDIATE",
    "ADVANCED",
    "PROFICIENCY",
  ];
  var level = TextEditingController();
  SingingCharacter? _character = SingingCharacter.beginer;
  @override
  void initState() {
    level.text = (context.read<UserProvider>().level);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
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
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: tr("Enter your name"),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return tr('Please enter some text');
            }
            return null;
          },
          onSaved: (val) {
            user.level = level.text;
            user.updateUser(user);
            // UserDAO().update(user);
          },
          onTap: () => showDialog(
            context: context,
            builder: (context) {
              return StatefulBuilder(builder: (context, setState) {
                return AlertDialog(
                  title: const Text("Select your level").tr(),
                  content: SingleChildScrollView(
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: _levels
                            .map(
                              (e) => RadioListTile<SingingCharacter>(
                                value:
                                    SingingCharacter.values[_levels.indexOf(e)],
                                title: Text(e).tr(),
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
