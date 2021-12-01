import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget createInput(String name, bool isPassword) => TextFormField(
      decoration: InputDecoration(
        labelText: name,
        hintText: 'Enter your' + name.toLowerCase(),
        contentPadding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      obscureText: isPassword,
    );
