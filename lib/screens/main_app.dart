import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_app/data/provider/local_app_sp.dart';
import 'package:lettutor_app/screens/Auth/login_screen.dart';
import 'package:lettutor_app/screens/my_tab_bar.dart';
import 'package:provider/provider.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool isLogin = false;
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        // print('User is currently signed out!');
        // user!.sendEmailVerification();
        setState(() {
          isLogin = false;
        });
      } else {
        // print('User is signed in!');
        setState(() {
          isLogin = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLogin ? const MyTabBar() : const LoginScreen();
  }
}
