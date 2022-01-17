import 'package:flutter/material.dart';
import 'package:let_tutor/models/tutor_feedback.dart';
import 'package:let_tutor/widgets/rating_star.dart';
import 'package:let_tutor/widgets/space.dart';

class RatingComment extends StatelessWidget {
  const RatingComment({Key? key, required this.feedbacks}) : super(key: key);

  final Feedbacks feedbacks;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(feedbacks.student!.avatar!),
              radius: 25,
            ),
            space(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    feedbacks.student!.name!,
                    style: const TextStyle(fontSize: 16),
                  ),
                  RatingStar(rating: feedbacks.rating!),
                  space(5),
                  Text(feedbacks.content!),
                  space(5),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      feedbacks.time,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
