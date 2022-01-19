import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:let_tutor/data/network/endpoints.dart';
import 'package:let_tutor/models/schedule_tutor.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<ScheduleTutorData>> getScheduleTutorAPI(String tutorId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Response response = await post(
    Uri.parse(Endpoints.getScheduleTutor),
    headers: {
      "Authorization": "Bearer " + prefs.getString("accessToken")!,
    },
    body: {
      "tutorId": tutorId,
    },
  );
  if (response.statusCode != 200) {
    log(response.body);
  }
  ScheduleTutorMessage scheduleTutorMessage =
      ScheduleTutorMessage.fromJson(jsonDecode(response.body));
  return scheduleTutorMessage.data!;
}
