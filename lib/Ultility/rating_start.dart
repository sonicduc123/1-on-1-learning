import 'package:flutter/material.dart';

class RatingStart extends StatelessWidget {
  const RatingStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 3,
      children: List.generate(
        5,
        (index) => Icon(
          Icons.star,
          color: Colors.yellow,
        ),
      ),
    );
  }
}
