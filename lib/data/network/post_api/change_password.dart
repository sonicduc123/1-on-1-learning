import 'dart:developer';

import 'package:http/http.dart';
import 'package:let_tutor/data/network/endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

changePasswordAPI(String newPassword) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Response response = await post(
    Uri.parse(Endpoints.changePassword),
    headers: {
      "Authorization": "Bearer " + prefs.getString("accessToken")!,
    },
    body: {
      "password": prefs.getString("password"),
      "newPassword": newPassword,
    },
  );
  prefs.setString("password", newPassword);
  if (response.statusCode != 200) {
    log(response.body);
  }
}
