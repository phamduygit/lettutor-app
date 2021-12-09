import 'package:flutter/material.dart';
import 'package:lettutor_app/service/provider/local_app_sp.dart';
import 'package:lettutor_app/screens/auth/login_screen.dart';
import 'package:lettutor_app/screens/my_tab_bar.dart';
import 'package:provider/provider.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  
  @override
  Widget build(BuildContext context) {
    final localApp = context.watch<LocalApp>();
    return localApp.getCurrentUserID == "" ? const LoginScreen() : const MyTabBar();
  }
}
