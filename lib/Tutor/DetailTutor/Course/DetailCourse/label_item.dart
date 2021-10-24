import 'package:flutter/material.dart';

class LabelItem extends StatelessWidget {
  const LabelItem(
      {Key? key, required this.number, required this.name, required this.color})
      : super(key: key);

  final String number;
  final String name;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        Text(
          number,
          style: TextStyle(
            fontSize: 30,
            color: color,
          ),
        ),
        Text(
          name,
          style: TextStyle(
            color: color,
          ),
        ),
      ],
    );
  }
}
