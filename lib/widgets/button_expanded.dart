import 'package:flutter/material.dart';

typedef VoidCallback = void Function();

Widget createButtonExpanded(String name, {VoidCallback? action}) => Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: action,
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
