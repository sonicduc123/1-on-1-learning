  // get list course
import 'dart:convert';

import 'package:http/http.dart';
import 'package:let_tutor/data/network/endpoints.dart';
import 'package:let_tutor/models/course.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<Courses>> getListCourseAPI() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Response response = await get(
      Uri.parse(Endpoints.getListCourse),
      headers: {
        "Authorization": "Bearer " + prefs.getString("accessToken")!,
      },
    );
    CourseMessage courseMessage = CourseMessage.fromJson(
      jsonDecode(response.body),
    );
    return courseMessage.data!.courses!;
  }