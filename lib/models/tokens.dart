import 'package:let_tutor/models/token.dart';

class Tokens {
  Token? access;
  Token? refresh;

  Tokens({this.access, this.refresh});

  Tokens.fromJson(Map<String, dynamic> json) {
    access = json['access'] != null ? Token.fromJson(json['access']) : null;
    refresh =
        json['refresh'] != null ? Token.fromJson(json['refresh']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (access != null) {
      data['access'] = access!.toJson();
    }
    if (refresh != null) {
      data['refresh'] = refresh!.toJson();
    }
    return data;
  }
}
