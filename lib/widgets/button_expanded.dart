import 'package:flutter/material.dart';

Widget createButtonExpanded(String name) => Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.only(top: 15, bottom: 15),
            ),
          ),
        ),
      ],
    );
