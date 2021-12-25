import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';

class AdvancedSetting extends StatefulWidget {
  const AdvancedSetting({Key? key}) : super(key: key);

  @override
  State<AdvancedSetting> createState() => _AdvancedSettingState();
}

class _AdvancedSettingState extends State<AdvancedSetting> {
  String dropdownValue = 'English';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Advanced setting").tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${tr("Languages")}: ",
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            DropdownButton<String>(
              value: tr(dropdownValue),
              items: <String>[
                tr('English'),
                tr('Vietnamese'),
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  if (newValue == "Tiếng Việt" || newValue == "Vietnamese") {
                    context.setLocale(const Locale('vi', 'VN'));
                    dropdownValue = "Vietnamese";
                  } else {
                    context.setLocale(const Locale('en', 'US'));
                    dropdownValue = "English";
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
