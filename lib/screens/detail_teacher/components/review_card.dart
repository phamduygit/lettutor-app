import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_app/models/review.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    Key? key,
    required this.review,
  }) : super(key: key);
  final Review review;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(review.avatar),
              radius: 30,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        review.username,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      // const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(
                          5,
                          (index) => Container(
                            padding: const EdgeInsets.only(right: 2),
                            child: Icon(
                              Icons.star,
                              color: Colors.yellow[700],
                              size: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(review.comment),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        DateFormat('yyyy-MM-dd – kk:mm').format(review.date),
                        style: TextStyle(
                            fontSize: 12, color: Colors.black.withOpacity(0.7)),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
