import 'package:flutter/material.dart';
import 'package:let_tutor/Function/space.dart';

Widget createInputWithIcon(IconData icon, String hint) => Row(
      children: [
        Icon(
          icon,
          color: Colors.blue,
          size: 30,
        ),
        space(20),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              hintText: hint,
            ),
          ),
        ),
      ],
    );
