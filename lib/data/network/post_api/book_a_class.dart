import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:let_tutor/data/network/endpoints.dart';
import 'package:let_tutor/models/error.dart';
import 'package:let_tutor/utils/handle_error_fetch.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> bookAClassAPI(
    String scheduleId, String note, BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Response response = await post(
    Uri.parse(Endpoints.bookAClass),
    headers: {
      "Authorization": "Bearer " + prefs.getString("accessToken")!,
      "Content-type": "application/json",
    },
    body: jsonEncode({
      "scheduleDetailIds": [scheduleId],
      "note": note,
    }),
  );
  if (response.statusCode != 200) {
    handleErrorFetch(response.body, context);
    ErrorFetch errorFetch = ErrorFetch.fromJson(jsonDecode(response.body));
    return errorFetch.message!;
  }   

  return "success";
}
