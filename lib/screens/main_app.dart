import 'package:flutter/material.dart';
import 'package:lettutor_app/screens/Auth/login_screen.dart';
import 'package:lettutor_app/screens/my_tab_bar.dart';
import 'package:lettutor_app/screens/on_boarding/on_boarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainApp extends StatefulWidget {
  const MainApp({ Key? key }) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int isOnBoarding = 1;
  int isLogin = 1;
  Future<void> initSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int flag1 = (prefs.getInt('isOnBoarding') ?? 0);
    int flag2 = (prefs.getInt('isLogin') ?? 0);
    setState(() {
      isOnBoarding = flag1;
      isLogin = flag2;
    });
  }
  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }
  @override
  Widget build(BuildContext context) {
    if (isOnBoarding == 1) {
      if (isLogin == 1) {
        return const MyTabBar();
      }
      return const LoginScreen();
    }
    return const OnBoardingScreen();
  }
}