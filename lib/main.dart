import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_theme.dart';
import 'package:lettutor_app/data/provider/tutors_provider.dart';
import 'package:lettutor_app/data/provider/user_provider.dart';
import 'package:lettutor_app/data/share_preference/local_sp.dart';
import 'package:lettutor_app/models/meeting_data.dart';
import 'package:lettutor_app/screens/auth/login_screen.dart';
import 'package:lettutor_app/screens/main_app.dart';
import 'package:provider/provider.dart';
import 'data/provider/local_app_sp.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
  LocalApp localApp = LocalApp();
  UserProvider user = UserProvider();
  initApp() async {
    String token = await LocalSP().getAccessToken();
    setState(() {
      localApp.setAccessToken(token);
    });
  }

  @override
  void initState() {
    super.initState();
    initApp();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => localApp),
        ChangeNotifierProvider(create: (context) => user),
        ChangeNotifierProvider(create: (context) => TutorsProvider()),
        ChangeNotifierProvider(create: (context) => MeetingData()),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        initialRoute: '/',
        routes: {
          '/': (context) => const MainApp(),
          '/login': (context) => const LoginScreen(),
        },
      ),
    );
  }
}
