import 'package:flutter/material.dart';
import 'package:lettutor_app/screens/profile/become_teacher.dart';
import 'package:lettutor_app/screens/profile/profile_screen.dart';

class EndDrawer extends StatelessWidget {
  const EndDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                const CircleAvatar(backgroundImage: AssetImage('assets/images/avatar.jpeg'), radius: 40,),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Phạm Minh Duy', style: TextStyle(fontSize: 18, color: Colors.white),),
                    SizedBox(height: 5),
                    Text("18120345@student.hcmus.edu.vn", style: TextStyle(fontSize: 14, color: Colors.white), maxLines: 1, overflow: TextOverflow.ellipsis),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person_outline_sharp, color: Colors.black, size: 28,),
            title: const Text('Profile', style: TextStyle(fontSize: 16, color: Colors.black),),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.school, color: Colors.black, size: 28,),
            title: const Text('Become A Tutor', style: TextStyle(fontSize: 16, color: Colors.black),),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const BecomeTeacher()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.menu_book, color: Colors.black, size: 28,),
            title: const Text('List of courses', style: TextStyle(fontSize: 16, color: Colors.black),),
            onTap: () {
              Navigator.pop(context);
              // Navigator.push(context, MaterialPageRoute(builder: (context) => const BecomeTeacher()));
            },
          ),
        ],
      ),
    );
  }
}
