import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LanguageTextFormField extends StatefulWidget {
  const LanguageTextFormField({
    Key? key,
  }) : super(key: key);

  @override
  State<LanguageTextFormField> createState() => _LanguageTextFormFieldState();
}

class _LanguageTextFormFieldState extends State<LanguageTextFormField> {
  var selectedLanguage = TextEditingController();
  List languages = [];
  @override
  void initState() {
    selectedLanguage.text = "";
    super.initState();
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/languages.json');
    final data = await json.decode(response);
    setState(() {
      languages = data;
    });
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
        // Autocomplete<String>(
        //   optionsBuilder: (TextEditingValue textEditingValue) {
        //     if (textEditingValue.text == '') {
        //       return const Iterable<String>.empty();
        //     }
        //     return languages.where((element) => element.toString().contains(textEditingValue.text.toString()));
        //   },
        // )
      ],
    );
  }
}
