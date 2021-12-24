import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_theme.dart';
import 'package:lettutor_app/models/user.dart';
import 'package:lettutor_app/screens/auth/login_screen.dart';
import 'package:lettutor_app/screens/main_app.dart';
import 'package:lettutor_app/data/provider/list_meeting.dart';
import 'package:lettutor_app/data/provider/list_review.dart';
import 'package:lettutor_app/data/provider/list_teacher.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/provider/local_app_sp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final localApp = LocalApp();
  User user = User(favorites: [], target: [], birthDay: DateTime.now());
  ListTeacher teachers = ListTeacher();
  initApp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userID = (prefs.getString('currentUserID') ?? "");
    setState(() {
      localApp.setID(userID);
    });
  }

  @override
  void initState() {
    initApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => localApp),
        ChangeNotifierProvider(create: (context) => user),
        ChangeNotifierProvider(create: (context) => teachers),
        ChangeNotifierProvider(create: (context) => ListMeeting()),
        ChangeNotifierProvider(create: (context) => ListReview()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.dark,
        initialRoute: '/',
        routes: {
          '/': (context) => const MainApp(),
          '/login': (context) => const LoginScreen(),
        },
      ),
    );
  }
}
