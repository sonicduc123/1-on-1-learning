import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:let_tutor/data/network/endpoints.dart';
import 'package:let_tutor/models/auth.dart';
import 'package:let_tutor/utils/handle_error_fetch.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> loginAccountAPI(String email, String password, BuildContext context) async {
  Response response = await post(Uri.parse(Endpoints.login), body: {
    "email": email,
    "password": password,
  });
  if (response.statusCode != 200) {
    handleErrorFetch(response.body, context);
    return false;
  } else {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email);
    prefs.setString("password", password);
    Auth auth = Auth.fromJson(jsonDecode(response.body));
    prefs.setString("accessToken", auth.tokens!.access!.token!);
    prefs.setString("refreshToken", auth.tokens!.refresh!.token!);
  }
  return true;
}
