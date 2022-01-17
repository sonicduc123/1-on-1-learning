import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:let_tutor/data/network/endpoints.dart';
import 'package:let_tutor/models/auth.dart';
import 'package:let_tutor/utils/handle_error_fetch.dart';
import 'package:let_tutor/widgets/dialog.dart';

void registerAccountAPI(
    String email, String password, BuildContext context) async {
  Response response = await post(
    Uri.parse(Endpoints.register),
    body: {'email': email, 'password': password},
  );

  if (response.statusCode != 201) {
    handleErrorFetch(response.body, context);
    return;
  }
  try {
    Auth auth = Auth.fromJson(jsonDecode(response.body));
  } catch (e) {
    log(e.toString());
  }
  Navigator.pop(context);
  makeDialog(
      'Success !!!',
      'You have register successfully. Please check your email to active!',
      context);
}
