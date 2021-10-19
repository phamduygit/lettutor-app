import 'package:flutter/material.dart';
import 'package:lettutor_app/contants.dart';
import 'package:lettutor_app/models/review.dart';
import 'package:lettutor_app/screens/detail_teacher/components/review_card.dart';

class Reviews extends StatelessWidget {
  const Reviews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Rating and Comment",
            style: TextStyle(fontSize: 16, color: mainColor),
          ),
          const SizedBox(height: 10),
          Column(
            children: List.generate(
              reviews.length,
              (index) => ReviewCard(
                review: reviews[index],
              ),
            ),
          )
        ],
      ),
    );
  }
}
