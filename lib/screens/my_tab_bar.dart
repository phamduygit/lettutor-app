import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:lettutor_app/models/user.dart';
import 'package:lettutor_app/data/provider/list_meeting.dart';
import 'package:lettutor_app/data/provider/list_review.dart';
import 'package:lettutor_app/data/provider/list_teacher.dart';
import 'package:lettutor_app/data/provider/local_app_sp.dart';
import 'package:lettutor_app/screens/home/home_screen.dart';
import 'package:lettutor_app/screens/messages/message_screen.dart';
import 'package:lettutor_app/screens/setting/setting_screen.dart';
import 'package:lettutor_app/screens/tutors/tutor_screen.dart';
import 'package:lettutor_app/screens/up_comming/upcomming_screen.dart';
import 'package:lettutor_app/data/sql_lite/meeting_dao.dart';
import 'package:lettutor_app/data/sql_lite/review_dao.dart';
import 'package:lettutor_app/data/sql_lite/user_dao.dart';
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
        .getUserById(context.watch<LocalApp>().getCurrentUserID)
        .then((value) {
      Provider.of<ListTeacher>(context, listen: false)
          .setListTeacher(value.favorites);
      Provider.of<User>(context, listen: false).updateUser(value);
    });
    MeetingDAO()
        .getListMeeting(context.watch<LocalApp>().getCurrentUserID)
        .then((value) => Provider.of<ListMeeting>(context, listen: false)
            .setListMeeting(value));
    ReviewDAO().getListReivew().then((value) =>
        Provider.of<ListReview>(context, listen: false).setListReview(value));
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.white,
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
        elevation: 5,
      ),
    );
  }
}
