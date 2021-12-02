import 'package:flutter/material.dart';
// import 'package:lettutor_app/screens/auth/components/default_button.dart';
import 'package:lettutor_app/contants.dart';
import 'package:lettutor_app/screens/auth/login_screen.dart';
import 'package:lettutor_app/screens/setting/session_history_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/info_account.dart';
import 'components/option_card.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  void _logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = 0;
    await prefs.setInt('isLogin', counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const InfoAccount(),
              const SizedBox(height: 30),
              OptionCard(
                icon: Icons.person_outline,
                title: "View Feedbacks",
                press: () {},
              ),
              OptionCard(
                icon: Icons.list_rounded,
                title: "Booking History",
                press: () {},
              ),
              OptionCard(
                icon: Icons.history,
                title: "Session History",
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
                title: "Advanced Settings",
                press: () {},
              ),
              const SizedBox(height: 30),
              OptionCard(
                icon: Icons.web_asset,
                title: "Our Website",
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
                  children: const [
                    Spacer(),
                    Text(
                      "Log out",
                      style: TextStyle(fontSize: 16),
                    ),
                    Spacer(),
                  ],
                ),
                onPressed: () {
                  _logOut();
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
