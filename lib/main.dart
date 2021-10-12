import 'package:flutter/material.dart';
import 'package:lettutor_app/screens/Auth/login_screen.dart';
import 'package:lettutor_app/screens/Auth/register_screen.dart';
// import 'package:lettutor_app/screens/OnBoarding/on_boarding.dart';

// import 'screens/Auth/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}
