import 'package:flutter/material.dart';
import 'AccountManagement/setting.dart';
import 'Authentication/forgot_password.dart';
import 'Authentication/login.dart';
import 'Authentication/register.dart';

void main() {
  runApp(const MaterialApp(
      title: 'My App',
      home: SafeArea(
        child: Setting(),
      )));
}
