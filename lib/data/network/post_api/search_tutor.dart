import 'dart:convert';

import 'package:http/http.dart';
import 'package:let_tutor/data/network/endpoints.dart';
import 'package:let_tutor/models/tutors.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<TutorsInfo> searchTutorAPI(int page, int perPage, List<String> specialties, String search) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Response response = await post(Uri.parse(Endpoints.searchTutor), headers: {
    "Authorization": "Bearer " + prefs.getString("accessToken")!,
    "Content-type": "application/json"
  }, body: jsonEncode({
    "page": page,
    "perPage": perPage,
    "filters": {
        "specialties": specialties,
    },
    "search": search
  }));

  TutorsInfo tutorsInfo = TutorsInfo.fromJson(jsonDecode(response.body));
  return tutorsInfo;
}
