import 'package:flutter/material.dart';
import 'package:let_tutor/ui/account/profile.dart';
import 'package:let_tutor/ui/account/setting.dart';
import 'package:let_tutor/ui/authentication/forgot_password.dart';
import 'package:let_tutor/ui/authentication/login.dart';
import 'package:let_tutor/ui/authentication/register.dart';
import 'package:let_tutor/ui/chat/chat.dart';
import 'package:let_tutor/ui/detail_course/detail_course.dart';
import 'package:let_tutor/ui/detail_tutor/detail_tutor.dart';
//import 'package:let_tutor/ui/homepage/homepage.dart';
import 'package:let_tutor/ui/meeting/meeting.dart';
import 'package:let_tutor/ui/schedule/booking_history/booking_history.dart';
import 'package:let_tutor/ui/schedule/session_history/session_history.dart';
import 'package:let_tutor/ui/schedule/upcoming/upcoming.dart';
import 'package:let_tutor/ui/tutor/tutor.dart';

class Routes {
  Routes._();

  // static variables
  static const String home = '/home';
  static const String login = '/login';
  static const String forgotPassword = '/forgot_password';
  static const String register = '/register';
  static const String chat = '/chat';
  static const String upcomming = '/upcomming';
  static const String tutor = '/tutor';
  static const String detailTutor = '/detail_tutor';
  static const String detailCourse = '/detail_course';
  static const String setting = '/setting';
  static const String profile = '/profile';
  static const String meeting = '/meeting';
  static const String bookingHistory = '/booking_history';
  static const String sessionHistory = '/session_history';

  static final routes = <String, WidgetBuilder>{
    // home: (BuildContext context) => HomePage(),
    // login: (BuildContext context) => Login(),
    register: (BuildContext context) => Register(),
    forgotPassword: (BuildContext context) => ForgotPassword(),
    chat: (BuildContext context) => Chat(),
    upcomming: (BuildContext context) => Upcoming(),
    tutor: (BuildContext context) => Tutor(),
    detailTutor: (BuildContext context) => DetailTutor(),
    detailCourse: (BuildContext context) => DetailCourse(),
    //setting: (BuildContext context) => Setting(),
    profile: (BuildContext context) => Profile(),
    meeting: (BuildContext context) => Meeting(),
    bookingHistory: (BuildContext context) => BookingHistory(),
    sessionHistory: (BuildContext context) => SessionHistory(),
  };
}
