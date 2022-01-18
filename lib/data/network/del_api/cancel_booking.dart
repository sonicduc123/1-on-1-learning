import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:let_tutor/data/network/endpoints.dart';
import 'package:let_tutor/utils/handle_error_fetch.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> cancelBookingAPI(String scheduleDetailId, BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> list = [scheduleDetailId];
  Response response = await delete(
    Uri.parse(Endpoints.cancelBooking),
    headers: {
      "Authorization": "Bearer " + prefs.getString("accessToken")!,
      "Content-Type": "application/json"
    },
    body: jsonEncode({
      'scheduleDetailIds': [scheduleDetailId]
    }),
  );
  if (response.statusCode != 200) {
    handleErrorFetch(response.body, context);
    return false;
  }
  return true;
}
