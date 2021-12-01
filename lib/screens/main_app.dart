import 'package:flutter/material.dart';
import 'package:lettutor_app/screens/Auth/login_screen.dart';
import 'package:lettutor_app/screens/on_boarding/on_boarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainApp extends StatefulWidget {
  const MainApp({ Key? key }) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int state = 1;
  Future<void> initSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int flag = (prefs.getInt('isOnBoarding') ?? 0);
    setState(() {
      state = flag;
    });
  }
  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }
  @override
  Widget build(BuildContext context) {
    if (state == 1) {
      return const LoginScreen();
    }
    return const OnBoardingScreen();
  }
}