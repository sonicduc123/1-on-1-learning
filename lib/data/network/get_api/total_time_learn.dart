import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:let_tutor/data/network/endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<int> getTotalTimeLearnAPI() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Response response =
      await get(Uri.parse(Endpoints.getTotalTimeLearn), headers: {
    "Authorization": "Bearer " + prefs.getString("accessToken")!,
  });
  var decode = jsonDecode(response.body);
  int totalTime = decode['total'];
  return totalTime;
}
