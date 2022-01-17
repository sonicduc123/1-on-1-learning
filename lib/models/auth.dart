import 'package:let_tutor/models/tokens.dart';
import 'package:let_tutor/models/user.dart';

class Auth {
  User? user;
  Tokens? tokens;

  Auth({this.user, this.tokens});

  Auth.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    tokens =
        json['tokens'] != null ? Tokens.fromJson(json['tokens']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (tokens != null) {
      data['tokens'] = tokens!.toJson();
    }
    return data;
  }
}