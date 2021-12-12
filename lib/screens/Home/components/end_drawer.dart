import 'package:flutter/material.dart';
import 'package:lettutor_app/models/user.dart';
import 'package:lettutor_app/screens/courses/courses_screen.dart';
import 'package:lettutor_app/screens/profile/become_teacher.dart';
import 'package:lettutor_app/screens/profile/profile_screen.dart';
import 'package:provider/provider.dart';

class EndDrawer extends StatelessWidget {
  const EndDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<User>();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(user.avatar),
                  radius: 40,
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      user.fullName == "" ? "..." : user.fullName,
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      user.email,
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.person_outline_sharp,
              color: Colors.black,
              size: 28,
            ),
            title: const Text(
              'Profile',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.school,
              color: Colors.black,
              size: 28,
            ),
            title: const Text(
              'Become A Tutor',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BecomeTeacher()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.menu_book,
              color: Colors.black,
              size: 28,
            ),
            title: const Text(
              'List of courses',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CoursesScreen()));
            },
          ),
        ],
      ),
    );
  }
}
