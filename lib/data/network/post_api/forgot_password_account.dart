import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:let_tutor/data/network/endpoints.dart';
import 'package:let_tutor/utils/handle_error_fetch.dart';
import 'package:let_tutor/widgets/dialog.dart';

void forgotPasswordAccountAPI(String email, BuildContext context) async {
  Response response = await post(
      Uri.parse(Endpoints.forgotPassword),
      body: {'email': email},
    );

    if (response.statusCode != 200) {
      handleErrorFetch(response.body, context);
    } else {
      makeDialog(
          'Check your email',
          'We just send an email to you with a link to reset your password',
          context);
    }
}