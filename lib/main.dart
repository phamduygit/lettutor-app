import 'package:flutter/material.dart';
import 'package:lettutor_app/models/user.dart';
import 'package:lettutor_app/screens/main_app.dart';
import 'package:lettutor_app/service/provider/list_meeting.dart';
import 'package:lettutor_app/service/provider/list_teacher.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'service/provider/local_app_sp.dart';

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
  User user = User(favorites: []);
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
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
          ),
        ),
        home: const MainApp(),
      ),
    );
  }
}
