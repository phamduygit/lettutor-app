import 'package:flutter/material.dart';
import 'package:lettutor_app/data/provider/user_provider.dart';
import 'package:lettutor_app/screens/courses/courses_screen.dart';
import 'package:lettutor_app/screens/profile/become_teacher.dart';
import 'package:lettutor_app/screens/profile/profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
class EndDrawer extends StatelessWidget {
  const EndDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>();
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
                      user.name == "" ? "..." : user.name,
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
              size: 28,
            ),
            title: const Text(
              'Profile',
              style: TextStyle(fontSize: 16),
            ).tr(),
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
              size: 28,
            ),
            title: const Text(
              'Become Tutor',
              style: TextStyle(fontSize: 16),
            ).tr(),
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
              size: 28,
            ),
            title: const Text(
              'Courses',
              style: TextStyle(fontSize: 16),
            ).tr(),
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
