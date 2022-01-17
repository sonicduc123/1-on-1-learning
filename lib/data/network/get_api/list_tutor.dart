import 'dart:convert';

import 'package:http/http.dart';
import 'package:let_tutor/data/network/endpoints.dart';
import 'package:let_tutor/models/tutors.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<TutorsInfo> getListTutorAPI() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Response response = await get(Uri.parse(Endpoints.getListTutor), headers: {
    "Authorization": "Bearer " + prefs.getString("accessToken")!,
  });

  TutorsInfo tutorsInfo = TutorsInfo.fromJson(jsonDecode(response.body));
  return tutorsInfo;
}
