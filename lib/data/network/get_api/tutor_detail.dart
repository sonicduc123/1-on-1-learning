import 'dart:convert';

import 'package:http/http.dart';
import 'package:let_tutor/data/network/endpoints.dart';
import 'package:let_tutor/models/tutor_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<TutorDetail> getTutorDetailAPI(String tutorId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Response response = await get(
    Uri.parse(Endpoints.getTutor + tutorId),
    headers: {
      "Authorization": "Bearer " + prefs.getString('accessToken')!,
    },
  );
  TutorDetail tutorDetail = TutorDetail.fromJson(jsonDecode(response.body));
  await tutorDetail.user!.convertCountryCode();
  return tutorDetail;
}
