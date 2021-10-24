import 'package:flutter/material.dart';
import 'package:let_tutor/AccountManagement/profile.dart';
import 'package:let_tutor/Homepage/homepage.dart';
import 'package:let_tutor/Tutor/tutor.dart';
import 'AccountManagement/setting/setting.dart';
import 'Authentication/forgot_password.dart';
import 'Authentication/login/login.dart';
import 'Authentication/register.dart';

void main() {
  runApp(const MaterialApp(
      title: 'My App',
      home: SafeArea(
        child: Tutor(),
      )));
}
