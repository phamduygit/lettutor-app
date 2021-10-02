import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SliderPage extends StatelessWidget {
  const SliderPage({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);
  final String image;
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SvgPicture.asset(image),
          const SizedBox(height: 60),
          Text(
            title,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              letterSpacing: 0.7,
            ),
          )
        ],
      ),
    );
  }
}
