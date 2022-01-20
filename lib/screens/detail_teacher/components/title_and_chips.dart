import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lettutor_app/data/api/another_api.dart';

class TitileAndChips extends StatefulWidget {
  const TitileAndChips({
    Key? key,
    required this.title,
    required this.chipsContent,
  }) : super(key: key);
  final String title;
  final List<String> chipsContent;

  @override
  State<TitileAndChips> createState() => _TitileAndChipsState();
}

class _TitileAndChipsState extends State<TitileAndChips> {
  List<String> chips = [];
  Future getLanguages() async {
    List<String> myChips = [];
    for (String languageKey in widget.chipsContent) {
      var languageName = await CommonAPI().getLanguageName(languageKey);
      myChips.add(languageName);
    }
    if (mounted) {
      setState(() {
        chips = myChips;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.title == "Languages") {
      getLanguages();
    } else {
      setState(() {
        chips = widget.chipsContent;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 16, color: mainColor),
          ),
          const SizedBox(height: 5),
          Wrap(
            spacing: 10,
            runSpacing: 0,
            children: List.generate(
              chips.length,
              (index) => Chip(
                label: Text(
                  chips[index],
                  style: const TextStyle(color: mainColor, fontSize: 12),
                ).tr(),
                backgroundColor: Colors.blue[50],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
