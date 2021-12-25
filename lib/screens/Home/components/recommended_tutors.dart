import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';

class RecommendedTutors extends StatelessWidget {
  const RecommendedTutors({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        children: [
          Container(
            child: const Text(
              "Recommnended Tutors",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ).tr(),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    width: 2.0, color: Colors.black.withOpacity(0.7)),
              ),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                const Text(
                  "See all",
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 16,
                  ),
                ).tr(),
                const Icon(
                  Icons.chevron_right,
                  color: mainColor,
                  size: 24,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
