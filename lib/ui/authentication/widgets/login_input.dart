import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:let_tutor/utils/validate_input.dart';

Widget createInput(String name, bool isPassword, TextEditingController controller) => TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: name,
        hintText: 'Enter your ' + name.toLowerCase(),
        contentPadding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      obscureText: isPassword,
      validator: (String? value) => validateInput(value, name),
    );
