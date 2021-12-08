import 'package:flutter/material.dart';
import 'package:lettutor_app/screens/main_app.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/local_app_sp.dart';

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
      providers: [ChangeNotifierProvider(create: (context) => localApp)],
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
