import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:lettutor_app/data/provider/local_app_sp.dart';
import 'package:lettutor_app/data/share_preference/local_sp.dart';
import 'package:lettutor_app/screens/setting/advanced_setting.dart';
import 'package:lettutor_app/screens/setting/booking_history.dart';
import 'package:lettutor_app/screens/setting/session_history_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'components/info_account.dart';
import 'components/option_card.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(fontWeight: FontWeight.w500),
        ).tr(),
      ),
      // backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const InfoAccount(),
              const SizedBox(height: 30),
              OptionCard(
                icon: Icons.person_outline,
                title: tr("View feedbacks"),
                press: () {},
              ),
              OptionCard(
                icon: Icons.list_rounded,
                title: tr("Booking history"),
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BookingHistory(),
                    ),
                  );
                },
              ),
              OptionCard(
                icon: Icons.history,
                title: tr("Session history"),
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SessionHistoryScreen(),
                    ),
                  );
                },
              ),
              OptionCard(
                icon: Icons.settings_outlined,
                title: tr("Advanced settings"),
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AdvancedSetting(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              OptionCard(
                icon: Icons.web_asset,
                title: tr("Our website"),
                press: () {},
              ),
              OptionCard(
                icon: Icons.facebook_outlined,
                title: "Facebook",
                press: () {},
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: mainColor,
                  onPrimary: Colors.white,
                  padding: const EdgeInsets.all(12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Row(
                  children: [
                    const Spacer(),
                    const Text(
                      "Log out",
                      style: TextStyle(fontSize: 16),
                    ).tr(),
                    const Spacer(),
                  ],
                ),
                onPressed: () async {
                  Provider.of<LocalApp>(context, listen: false)
                      .setAccessToken("");
                  LocalSP().setAccessToken("");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
