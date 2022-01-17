import 'dart:convert';

import 'package:http/http.dart';
import 'package:let_tutor/data/network/endpoints.dart';
import 'package:let_tutor/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<User> changeAvatarAPI(String path) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  //create multipart request for POST or PATCH method
  MultipartRequest request =
      MultipartRequest("POST", Uri.parse(Endpoints.uploadAvatar));
  request.headers["Authorization"] =
      "Bearer " + prefs.getString("accessToken")!;
  //create multipart using filepath, string or bytes
  MultipartFile pic = await MultipartFile.fromPath("avatar", path);
  //add multipart to request
  request.files.add(pic);
  var response = await request.send();
  //Get the response from the server
  var responseData = await response.stream.toBytes();
  var responseString = String.fromCharCodes(responseData);
  return User.fromJson(jsonDecode(responseString));
}
