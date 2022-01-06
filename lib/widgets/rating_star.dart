import 'package:flutter/material.dart';

class RatingStar extends StatelessWidget {
  const RatingStar({Key? key, required this.rating}) : super(key: key);
  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Row(
        children: List.generate(
          rating,
          (index) => Icon(
            Icons.star,
            color: Colors.yellow,
          ),
        ),
      ),
      Row(
        children: List.generate(
          5 - rating,
          (index) => Icon(
            Icons.star,
            color: Colors.grey[400],
          ),
        ),
      ),
    ]);
  }
}
