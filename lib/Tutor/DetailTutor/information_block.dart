import 'package:flutter/material.dart';
import 'package:let_tutor/Ultility/space.dart';

import 'information_field.dart';

class InforBlock extends StatelessWidget {
  const InforBlock({Key? key, required this.field, required this.description})
      : super(key: key);

  final String field;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InforField(title: field),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              description,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ),
        ),
        space(10),
      ],
    );
  }
}
