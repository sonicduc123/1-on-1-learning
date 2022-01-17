// get detail course
import 'dart:convert';

import 'package:http/http.dart';
import 'package:let_tutor/data/network/endpoints.dart';
import 'package:let_tutor/models/course.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Courses> getCourseDetailAPI(String courseID) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  Response response =
      await get(Uri.parse(Endpoints.getCourse + courseID), headers: {
    "Authorization": "Bearer " + pref.getString("accessToken")!,
  });
  CourseDetail courseDetail = CourseDetail.fromJson(
    jsonDecode(response.body),
  );
  return courseDetail.course!;
}
