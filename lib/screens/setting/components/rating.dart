import 'package:flutter/material.dart';

class RatingStar extends StatefulWidget {
  const RatingStar(
      {Key? key, required this.saveNumberOfStar, required this.numberOfStar})
      : super(key: key);
  final void Function(int) saveNumberOfStar;
  final int numberOfStar;
  @override
  _RatingStarState createState() => _RatingStarState();
}

class _RatingStarState extends State<RatingStar> {
  List<bool> rates = [true, true, true, true, true];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 5; i++) {
      if (i < widget.numberOfStar) {
        rates[i] = true;
      } else {
        rates[i] = false;
      }
    }
  }

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
              widget.saveNumberOfStar(1);
            },
            child: Icon(
              Icons.star,
              color: rates[0] ? Colors.yellow[700] : Colors.yellow[200],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                rates = [true, true, false, false, false];
              });
              widget.saveNumberOfStar(2);
            },
            child: Icon(
              Icons.star,
              color: rates[1] ? Colors.yellow[700] : Colors.yellow[200],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                rates = [true, true, true, false, false];
              });
              widget.saveNumberOfStar(3);
            },
            child: Icon(
              Icons.star,
              color: rates[2] ? Colors.yellow[700] : Colors.yellow[200],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                rates = [true, true, true, true, false];
              });
              widget.saveNumberOfStar(4);
            },
            child: Icon(
              Icons.star,
              color: rates[3] ? Colors.yellow[700] : Colors.yellow[200],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                rates = [true, true, true, true, true];
              });
              widget.saveNumberOfStar(5);
            },
            child: Icon(
              Icons.star,
              color: rates[4] ? Colors.yellow[700] : Colors.yellow[200],
            ),
          ),
        ),
      ],
    );
  }
}
