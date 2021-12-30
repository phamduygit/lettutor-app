import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_theme.dart';
import 'package:lettutor_app/data/provider/user_provider.dart';
import 'package:lettutor_app/screens/auth/login_screen.dart';
import 'package:lettutor_app/screens/main_app.dart';
import 'package:lettutor_app/data/provider/list_meeting.dart';
import 'package:lettutor_app/data/provider/list_review.dart';
import 'package:lettutor_app/data/provider/list_teacher.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/provider/local_app_sp.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('vi', 'VN')],
      path:
          'assets/translations', // <-- change the path of the translation files
      // fallbackLocale: const Locale('en', 'US'),
      child: const MyApp(),
    ),
    // const MyApp()
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final localApp = LocalApp();
  UserProvider user = UserProvider(favorites: [], target: [], birthDay: DateTime.now());
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
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
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
