// get list schedule
import 'dart:convert';

import 'package:http/http.dart';
import 'package:let_tutor/data/network/endpoints.dart';
import 'package:let_tutor/models/schedule.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<Schedule>> getListHistoryAPI(int page, int perPage) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int now = DateTime.now().millisecondsSinceEpoch;
  Response response = await get(
    Uri.parse(Endpoints.getListSchedule +
        "sortBy=desc" +
        "&page=$page" +
        "&perPage=$perPage" +
        "&dateTimeLte=$now"),
    headers: {"Authorization": "Bearer " + prefs.getString("accessToken")!},
  );
  ScheduleMessage scheduleMessage = ScheduleMessage.fromJson(
    jsonDecode(response.body),
  );
  return scheduleMessage.data!.schedules!;
}
