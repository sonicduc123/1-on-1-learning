import 'package:flutter/material.dart';
import 'package:let_tutor/ui/authentication/forgot_password.dart';
import 'package:let_tutor/ui/authentication/register.dart';
import 'package:let_tutor/ui/course/course_page.dart';
import 'package:let_tutor/ui/detail_course/detail_course.dart';
import 'package:let_tutor/ui/detail_tutor/detail_tutor.dart';
import 'package:let_tutor/ui/detail_tutor/models/detail_tutor_argument.dart';
//import 'package:let_tutor/ui/homepage/homepage.dart';
import 'package:let_tutor/ui/meeting/video_call.dart';
import 'package:let_tutor/ui/schedule/booking_history/booking_history.dart';
import 'package:let_tutor/ui/schedule/session_history/session_history.dart';
import 'package:let_tutor/ui/tutor/tutor.dart';

class Routes {
  Routes._();

  // static variables
  static const String home = '/home';
  static const String login = '/login';
  static const String forgotPassword = '/forgot_password';
  static const String register = '/register';
  //static const String chat = '/chat';
  static const String upcomming = '/upcomming';
  static const String tutor = '/tutor';
  static const String detailTutor = '/detail_tutor';
  static const String course = '/course';
  static const String detailCourse = '/detail_course';
  static const String setting = '/setting';
  static const String profile = '/profile';
  static const String meeting = '/meeting';
  static const String bookingHistory = '/booking_history';
  static const String sessionHistory = '/session_history';

  static final routes = <String, WidgetBuilder>{
    // home: (BuildContext context) => HomePage(),
    // login: (BuildContext context) => Login(),
    register: (BuildContext context) => const Register(),
    forgotPassword: (BuildContext context) => const ForgotPassword(),
    //chat: (BuildContext context) => Chat(),
    // upcomming: (BuildContext context) => Upcoming(),
    //tutor: (BuildContext context) => const Tutor(),
    course: (BuildContext context) => const CoursePage(),
    //setting: (BuildContext context) => Setting(),

    // meeting: (BuildContext context) => Meeting(),
    bookingHistory: (BuildContext context) => const BookingHistory(),
    sessionHistory: (BuildContext context) => const SessionHistory(),
  };

  static generateRoute(settings) {
    if (settings.name == Routes.detailTutor) {
      DetailTutorArgument args = settings.arguments as DetailTutorArgument;
      return MaterialPageRoute(builder: (context) {
        return DetailTutor(
          tutorId: args.tutorId,
          callback: args.callback,
        );
      });
    } else if (settings.name == Routes.detailCourse) {
      String courseID = settings.arguments as String;
      return MaterialPageRoute(builder: (context) {
        return DetailCourse(courseID: courseID);
      });
    }
  }
}
