import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:lettutor_app/service/provider/list_teacher.dart';
import 'package:lettutor_app/service/provider/local_app_sp.dart';
import 'package:lettutor_app/models/user.dart';
import 'package:lettutor_app/screens/home/home_screen.dart';
import 'package:lettutor_app/screens/messages/message_screen.dart';
import 'package:lettutor_app/screens/setting/setting_screen.dart';
import 'package:lettutor_app/screens/tutors/tutor_screen.dart';
import 'package:lettutor_app/screens/up_comming/upcomming_screen.dart';
import 'package:lettutor_app/service/sql_lite/user_dao.dart';
import 'package:provider/provider.dart';

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
  Widget build(BuildContext context) {
    UserDAO()
        .getUser(context.watch<LocalApp>().getCurrentUserID)
        .then((value) {
      Provider.of<User>(context, listen: false).updateUser(value);
      Provider.of<ListTeacher>(context, listen: false).setListTeacher(value.favorites);
    });
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: mainColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Upcoming',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Tutors',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: mainColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
