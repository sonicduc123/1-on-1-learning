import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:let_tutor/models/error.dart';

void handleErrorFetch(String body, BuildContext context) {
  ErrorFetch errorFetch = ErrorFetch.fromJson(jsonDecode(body));
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(errorFetch.message!)),
  );
}
