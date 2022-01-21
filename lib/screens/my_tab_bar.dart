import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:lettutor_app/data/api/user_api.dart';
import 'package:lettutor_app/data/provider/local_app_sp.dart';
import 'package:lettutor_app/data/provider/user_provider.dart';
import 'package:lettutor_app/screens/home/home_screen.dart';
import 'package:lettutor_app/screens/messages/message_screen.dart';
import 'package:lettutor_app/screens/setting/setting_screen.dart';
import 'package:lettutor_app/screens/tutors/tutor_screen.dart';
import 'package:lettutor_app/screens/up_comming/upcomming_screen.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({Key? key}) : super(key: key);

  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    MessageScreen(),
    Upcomming(),
    Tutors(),
    SettingScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    String token = Provider.of<LocalApp>(context, listen: false).getAccessToken;
    UserAPI().getUserInformation(token).then((value) {
      UserProvider newUser = UserProvider.fromJson(value["user"]);
      Provider.of<UserProvider>(context, listen: false).updateUser(newUser);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: tr('Home'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.message),
            label: tr('Message'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.access_time),
            label: tr('Upcoming'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.people),
            label: tr('Tutors'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: tr('Settings'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: mainColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        elevation: 5,
      ),
    );
  }
}
