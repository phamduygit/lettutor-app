import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_app/models/teacher.dart';

class OverViewTeacher extends StatelessWidget {
  const OverViewTeacher({
    Key? key,
    required this.teacher,
  }) : super(key: key);
  final Teacher teacher;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(teacher.avatar),
          radius: 45,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              teacher.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                5,
                (index) => Container(
                  padding: const EdgeInsets.only(right: 4),
                  child: Icon(
                    Icons.star,
                    color: Colors.yellow[700],
                    size: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                SvgPicture.asset(
                  "assets/images/viet_nam.svg",
                  width: 30,
                  height: 15,
                ),
                const SizedBox(width: 5),
                const Text("Vietnam", style: TextStyle(fontSize: 16)),
              ],
            )
          ],
        )
      ],
    );
  }
}
