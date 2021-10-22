import 'package:flutter/material.dart';

class RatingStar extends StatefulWidget {
  const RatingStar({Key? key}) : super(key: key);

  @override
  _RatingStarState createState() => _RatingStarState();
}

class _RatingStarState extends State<RatingStar> {
  List<bool> rates = [true, true, true, true, true];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                rates = [true, false, false, false, false];
              });
            },
            child: Icon(Icons.star, color: rates[0] ? Colors.yellow[700] : Colors.yellow[200],),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                rates = [true, true, false, false, false];
              });
            },
            child: Icon(Icons.star, color: rates[1] ? Colors.yellow[700] : Colors.yellow[200],),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                rates = [true, true, true, false, false];
              });
            },
            child: Icon(Icons.star, color: rates[2] ? Colors.yellow[700] : Colors.yellow[200],),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                rates = [true, true, true, true, false];
              });
            },
            child: Icon(Icons.star, color: rates[3] ? Colors.yellow[700] : Colors.yellow[200],),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                rates = [true, true, true, true, true];
              });
            },
            child: Icon(Icons.star, color: rates[4] ? Colors.yellow[700] : Colors.yellow[200],),
          ),
        ),
      ],
    );
  }
}
