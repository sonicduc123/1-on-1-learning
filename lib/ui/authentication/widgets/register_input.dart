import 'package:flutter/material.dart';
import 'package:let_tutor/utils/validate_input.dart';
import 'package:let_tutor/widgets/space.dart';

Widget createRegisterInput(String name, bool isPassword,
    {TextEditingController? controller,
    TextEditingController? passwordController}) {
  return Column(
    children: [
      space(20),
      Align(
        alignment: Alignment.topLeft,
        child: Text(
          name,
          style: const TextStyle(fontSize: 15),
        ),
      ),
      space(5),
      TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Enter your ' + name.toLowerCase(),
          contentPadding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        obscureText: isPassword,
        validator: (value) {
          if (name == "Confirm password") {
            if (controller!.text != passwordController!.text) {
              return "Your confirm password must be same your password";
            }
          }
          return validate_input(value, name);
        },
      ),
    ],
  );
}
