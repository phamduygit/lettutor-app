import 'package:flutter/material.dart';
import 'package:lettutor_app/constants/app_constants.dart';
import 'package:lettutor_app/models/teacher.dart';
import 'package:lettutor_app/screens/detail_teacher/components/review_card.dart';
import 'package:lettutor_app/service/provider/list_review.dart';
import 'package:provider/provider.dart';

class Reviews extends StatelessWidget {
  const Reviews({
    Key? key, required this.teacher,
  }) : super(key: key);
  final Teacher teacher;
  @override
  Widget build(BuildContext context) {
    final reviews = context.read<ListReview>();
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
              reviews.getReviewOfTeacher(teacher).length,
              (index) => ReviewCard(
                review: reviews.getReviewOfTeacher(teacher)[index],
              ),
            ),
          )
        ],
      ),
    );
  }
}
