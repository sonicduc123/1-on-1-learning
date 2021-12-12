import 'package:flutter/material.dart';
import 'space.dart';

Widget createInputWithIcon(IconData icon, String hint, TextEditingController controller) => Row(
      children: [
        Icon(
          icon,
          color: Colors.blue,
          size: 30,
        ),
        space(20),
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
            ),
          ),
        ),
      ],
    );
