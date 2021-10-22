import 'package:flutter/material.dart';
import 'package:let_tutor/Authentication/login.dart';

void main() {
  runApp(const MaterialApp(
      title: 'My App',
      home: SafeArea(
        child: Login(),
      )));
}
