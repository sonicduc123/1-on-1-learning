import 'package:flutter/material.dart';
import 'package:let_tutor/widgets/rating_star.dart';
import 'package:let_tutor/widgets/space.dart';

class DetailTutorHeader extends StatelessWidget {
  const DetailTutorHeader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/avatar.png'),
          radius: 45,
        ),
        space(10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              space(10),
              const Text(
                'Pham Anh Duc',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              space(10),
              const Text(
                'Teacher',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              space(10),
              const Text('Vietnam'),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            RatingStar(rating: 5),
            space(15),
            const Icon(
              Icons.favorite_outline,
              color: Colors.blue,
              size: 30,
            ),
          ],
        )
      ],
    );
  }
}