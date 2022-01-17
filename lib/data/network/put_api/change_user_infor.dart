import 'dart:developer';

import 'package:http/http.dart';
import 'package:let_tutor/data/network/endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

changeUserInforAPI(
    String name, String language, String country, String birthday) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // put user infor
  Response response = await put(
    Uri.parse(Endpoints.changeUserInfor),
    headers: {
      "Authorization": "Bearer " + prefs.getString("accessToken")!,
    },
    body: {
      "name": name,
      "language": language,
      "country": country,
      "birthday": birthday,
    },
  );

  if (response.statusCode != 200) {
    log(response.body);
  }
}
