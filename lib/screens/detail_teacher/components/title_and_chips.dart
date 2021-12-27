import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';

class TitileAndChips extends StatelessWidget {
  const TitileAndChips({
    Key? key,
    required this.title,
    required this.chipsContent,
  }) : super(key: key);
  final String title;
  final List<String> chipsContent;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, color: mainColor),
          ),
          const SizedBox(height: 5),
          Wrap(
            spacing: 10,
            runSpacing: 0,
            children: List.generate(
              chipsContent.length,
              (index) => Chip(
                label: Text(
                  chipsContent[index],
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
