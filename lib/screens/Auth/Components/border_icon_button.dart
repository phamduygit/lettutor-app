import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_app/contants.dart';

class BorderIconButton extends StatelessWidget {
  const BorderIconButton({
    Key? key,
    required this.iconName,
  }) : super(key: key);
  final String iconName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            width: 1,
            color: mainColor,
          ),
        ),
        child: SvgPicture.asset(
          iconName,
          width: 36,
          height: 36,
        ),
      ),
    );
  }
}
