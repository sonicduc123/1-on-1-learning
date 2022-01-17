import 'package:flutter/material.dart';
import 'package:let_tutor/utils/validate_input.dart';
import 'space.dart';

Widget createInputWithIcon(
        IconData icon, String hint, TextEditingController controller) =>
    Row(
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
              hintText: "Enter your " + hint.toLowerCase(),
            ),
            validator: (value) => validateInput(value, hint),
            obscureText: hint == 'Password',
          ),
        ),
      ],
    );
