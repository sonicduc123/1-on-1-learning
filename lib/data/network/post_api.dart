
import 'package:flutter/cupertino.dart';
import 'package:let_tutor/data/network/post_api/change_avatar.dart';
import 'package:let_tutor/data/network/post_api/change_password.dart';
import 'package:let_tutor/data/network/post_api/forgot_password_account.dart';
import 'package:let_tutor/data/network/post_api/login_account.dart';
import 'package:let_tutor/data/network/post_api/register_account.dart';

class PostAPI {
  // change password
  static changePassword(String newPassword) => changePasswordAPI(newPassword);

  // change avatar
  static changeAvatar(String path) => changeAvatarAPI(path);

  // register
  static registerAccount(String email, String password, BuildContext context) =>
      registerAccountAPI(email, password, context);

  // login
  static loginAccount(String email, String password, BuildContext context) =>
      loginAccountAPI(email, password, context);

  // forgot password
  static forgotPasswordAccount(String email, BuildContext context) =>
      forgotPasswordAccountAPI(email, context);
}
