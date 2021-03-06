import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:lettutor_app/models/teacher_info.dart';

class OverViewTeacher extends StatefulWidget {
  const OverViewTeacher({
    Key? key,
    required this.teacher,
  }) : super(key: key);
  final TeacherInfo teacher;

  @override
  State<OverViewTeacher> createState() => _OverViewTeacherState();
}

class _OverViewTeacherState extends State<OverViewTeacher> {
  Future<void> fetchCountry() async {
    final response = await http.get(
      Uri.parse(
        'https://restcountries.com/v2/alpha/${widget.teacher.User!.country}',
      ),
    );
    if (response.statusCode == 200) {
      setState(() {
        json = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load album');
    }
  }

  Map<String, dynamic> json = {};
  @override
  void initState() {
    super.initState();
    fetchCountry();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(widget.teacher.User!.avatar),
          radius: 45,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.teacher.User!.name,
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
                    index < widget.teacher.User!.getRating() - 0.5
                        ? Icons.star
                        : index - widget.teacher.User!.getRating() + 0.25 > 0
                            ? Icons.star_border
                            : Icons.star_half,
                    color: Colors.yellow[700],
                    size: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                SvgPicture.network(
                  json["flag"] ?? "https://flagcdn.com/vn.svg",
                  height: 15,
                  width: 30,
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 200,
                  child: Text(
                    "${json["name"] ?? "none"}",
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
