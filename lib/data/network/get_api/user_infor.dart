import 'dart:convert';

import 'package:http/http.dart';
import 'package:let_tutor/data/network/endpoints.dart';
import 'package:let_tutor/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<UserInfor> getUserInforAPI() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Response response = await get(Uri.parse(Endpoints.getUserInfor), headers: {
    "Authorization": "Bearer " + prefs.getString("accessToken")!,
  });
  UserInfor userInfor = UserInfor.fromJson(jsonDecode(response.body));
  userInfor.changeNotify();

  return userInfor;
}
