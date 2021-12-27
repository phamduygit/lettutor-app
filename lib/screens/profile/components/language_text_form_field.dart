import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:language_picker/language_picker.dart';
import 'package:language_picker/languages.dart';

class LanguageTextFormField extends StatefulWidget {
  const LanguageTextFormField({
    Key? key, required this.title,
  }) : super(key: key);
  final String title;
  @override
  State<LanguageTextFormField> createState() => _LanguageTextFormFieldState();
}

class _LanguageTextFormFieldState extends State<LanguageTextFormField> {
  final _selectedLanguage = TextEditingController();
  List languages = [];
  @override
  void initState() {
    _selectedLanguage.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          controller: _selectedLanguage,
          keyboardType: TextInputType.none,
          readOnly: true,
          maxLines: null,
          decoration:  InputDecoration(
            border: const OutlineInputBorder(),
            hintText: tr("Select your language"),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return tr('Please enter some text');
            }
            return null;
          },
          onTap: () {_openLanguagePickerDialog();},
        ),
      ],
    );
  }

  void _openLanguagePickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.pink),
          child: LanguagePickerDialog(
            titlePadding: const EdgeInsets.all(8.0),
            searchCursorColor: Colors.pinkAccent,
            searchInputDecoration: const InputDecoration(hintText: 'Search...'),
            isSearchable: true,
            title: const Text('Select your language'),
            onValuePicked: (Language language) => setState(
              () {
                _selectedLanguage.text = language.name;
              },
            ),
          ),
        ),
      );
}
