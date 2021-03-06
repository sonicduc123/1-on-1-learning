import 'package:flutter/material.dart';

typedef VoidCallback = void Function();

Widget listItem(IconData icon, String name, {VoidCallback? action}) => Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.black,
          size: 30,
        ),
        title: Text(
          name,
          style: const TextStyle(color: Colors.black),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.black,
          size: 15,
        ),
        onTap: action,
      ),
    );
