import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar createAppBar(String title, bool isHaveLeading, BuildContext context) =>
    AppBar(
      leading: isHaveLeading
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null,
      title: Text(title,
          style: const TextStyle(
            color: Colors.black,
          )),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      centerTitle: true,
    );
